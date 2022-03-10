class RequestsController < ApplicationController
  before_action :current_user_must_be_request_user,
                only: %i[edit update destroy]

  before_action :set_request, only: %i[show edit update destroy]

  def index
    @q = current_user.requests.ransack(params[:q])
    @requests = @q.result(distinct: true).includes(:user, :add_on_services,
                                                   :active_gigs, :providers).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@requests.where.not(dropoff_location_latitude: nil)) do |request, marker|
      marker.lat request.dropoff_location_latitude
      marker.lng request.dropoff_location_longitude
    end
    @location_hash = Gmaps4rails.build_markers(@requests.where.not(pickup_location_latitude: nil)) do |request, marker|
      marker.lat request.pickup_location_latitude
      marker.lng request.pickup_location_longitude
    end
  end

  def show
    @gig = Gig.new
    @add_on_service = AddOnService.new
  end

  def new
    @request = Request.new
  end

  def edit; end

  def create
    @request = Request.new(request_params)

    if @request.save
      message = "Request was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @request, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @request.update(request_params)
      redirect_to @request, notice: "Request was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    message = "Request was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to requests_url, notice: message
    end
  end

  private

  def current_user_must_be_request_user
    set_request
    unless current_user == @request.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:pickup_datetime, :pickup_location,
                                    :dropoff_datetime, :dropoff_location, :user_id)
  end
end
