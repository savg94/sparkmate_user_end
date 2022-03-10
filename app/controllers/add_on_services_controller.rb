class AddOnServicesController < ApplicationController
  before_action :set_add_on_service, only: %i[show edit update destroy]

  # GET /add_on_services
  def index
    @q = AddOnService.ransack(params[:q])
    @add_on_services = @q.result(distinct: true).includes(:request).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@add_on_services.where.not(maintenance_location_latitude: nil)) do |add_on_service, marker|
      marker.lat add_on_service.maintenance_location_latitude
      marker.lng add_on_service.maintenance_location_longitude
      marker.infowindow "<h5><a href='/add_on_services/#{add_on_service.id}'>#{add_on_service.created_at}</a></h5><small>#{add_on_service.maintenance_location_formatted_address}</small>"
    end
  end

  # GET /add_on_services/1
  def show; end

  # GET /add_on_services/new
  def new
    @add_on_service = AddOnService.new
  end

  # GET /add_on_services/1/edit
  def edit; end

  # POST /add_on_services
  def create
    @add_on_service = AddOnService.new(add_on_service_params)

    if @add_on_service.save
      message = "AddOnService was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @add_on_service, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /add_on_services/1
  def update
    if @add_on_service.update(add_on_service_params)
      redirect_to @add_on_service,
                  notice: "Add on service was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /add_on_services/1
  def destroy
    @add_on_service.destroy
    message = "AddOnService was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to add_on_services_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_add_on_service
    @add_on_service = AddOnService.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def add_on_service_params
    params.require(:add_on_service).permit(:fast_charge, :regular_charge,
                                           :interior_cleaning, :exterior_cleaning, :daily_checks, :scheduled_maintenance, :maintenance_datetime, :maintenance_location, :request_id)
  end
end
