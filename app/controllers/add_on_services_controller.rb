class AddOnServicesController < ApplicationController
  before_action :set_add_on_service, only: %i[show edit update destroy]

  def index
    @q = AddOnService.ransack(params[:q])
    @add_on_services = @q.result(distinct: true).includes(:request).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@add_on_services.where.not(maintenance_location_latitude: nil)) do |add_on_service, marker|
      marker.lat add_on_service.maintenance_location_latitude
      marker.lng add_on_service.maintenance_location_longitude
    end
  end

  def show; end

  def new
    @add_on_service = AddOnService.new
  end

  def edit; end

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

  def update
    if @add_on_service.update(add_on_service_params)
      redirect_to @add_on_service,
                  notice: "Add on service was successfully updated."
    else
      render :edit
    end
  end

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

  def set_add_on_service
    @add_on_service = AddOnService.find(params[:id])
  end

  def add_on_service_params
    params.require(:add_on_service).permit(:fast_charge, :regular_charge,
                                           :interior_cleaning, :exterior_cleaning, :daily_checks, :scheduled_maintenance, :maintenance_datetime, :maintenance_location, :request_id)
  end
end
