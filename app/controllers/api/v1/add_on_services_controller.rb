class Api::V1::AddOnServicesController < Api::V1::GraphitiController
  def index
    add_on_services = AddOnServiceResource.all(params)
    respond_with(add_on_services)
  end

  def show
    add_on_service = AddOnServiceResource.find(params)
    respond_with(add_on_service)
  end

  def create
    add_on_service = AddOnServiceResource.build(params)

    if add_on_service.save
      render jsonapi: add_on_service, status: :created
    else
      render jsonapi_errors: add_on_service
    end
  end

  def update
    add_on_service = AddOnServiceResource.find(params)

    if add_on_service.update_attributes
      render jsonapi: add_on_service
    else
      render jsonapi_errors: add_on_service
    end
  end

  def destroy
    add_on_service = AddOnServiceResource.find(params)

    if add_on_service.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: add_on_service
    end
  end
end
