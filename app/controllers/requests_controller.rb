class RequestsController < ApplicationController
  before_action :current_user_must_be_request_user,
                only: %i[edit update destroy]

  before_action :set_request, only: %i[show edit update destroy]

  # GET /requests
  def index
    @q = current_user.requests.ransack(params[:q])
    @requests = @q.result(distinct: true).includes(:user, :add_on_services,
                                                   :active_gigs, :providers).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@requests.where.not(dropoff_location_latitude: nil)) do |request, marker|
      marker.lat request.dropoff_location_latitude
      marker.lng request.dropoff_location_longitude
      marker.infowindow "<h5><a href='/requests/#{request.id}'>#{request.pickup_datetime}</a></h5><small>#{request.dropoff_location_formatted_address}</small>"
    end
    @location_hash = Gmaps4rails.build_markers(@requests.where.not(pickup_location_latitude: nil)) do |request, marker|
      marker.lat request.pickup_location_latitude
      marker.lng request.pickup_location_longitude
      marker.infowindow "<h5><a href='/requests/#{request.id}'>#{request.pickup_datetime}</a></h5><small>#{request.pickup_location_formatted_address}</small>"
    end
  end

  # GET /requests/1
  def show
    @gig = Gig.new
    @add_on_service = AddOnService.new
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests
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

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      redirect_to @request, notice: "Request was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /requests/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def request_params
    params.require(:request).permit(:pickup_datetime, :pickup_location,
                                    :dropoff_datetime, :dropoff_location, :user_id)
  end
end
