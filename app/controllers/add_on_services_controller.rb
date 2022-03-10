class AddOnServicesController < ApplicationController
  before_action :set_add_on_service, only: [:show, :edit, :update, :destroy]

  # GET /add_on_services
  def index
    @add_on_services = AddOnService.all
  end

  # GET /add_on_services/1
  def show
  end

  # GET /add_on_services/new
  def new
    @add_on_service = AddOnService.new
  end

  # GET /add_on_services/1/edit
  def edit
  end

  # POST /add_on_services
  def create
    @add_on_service = AddOnService.new(add_on_service_params)

    if @add_on_service.save
      redirect_to @add_on_service, notice: 'Add on service was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /add_on_services/1
  def update
    if @add_on_service.update(add_on_service_params)
      redirect_to @add_on_service, notice: 'Add on service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /add_on_services/1
  def destroy
    @add_on_service.destroy
    redirect_to add_on_services_url, notice: 'Add on service was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_on_service
      @add_on_service = AddOnService.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def add_on_service_params
      params.require(:add_on_service).permit(:fast_charge, :regular_charge, :interior_cleaning, :exterior_cleaning, :daily_checks, :scheduled_maintenance, :maintenance_datetime, :maintenance_location, :request_id)
    end
end