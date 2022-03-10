class Api::V1::RequestsController < Api::V1::GraphitiController
  def index
    requests = RequestResource.all(params)
    respond_with(requests)
  end

  def show
    request = RequestResource.find(params)
    respond_with(request)
  end

  def create
    request = RequestResource.build(params)

    if request.save
      render jsonapi: request, status: :created
    else
      render jsonapi_errors: request
    end
  end

  def update
    request = RequestResource.find(params)

    if request.update_attributes
      render jsonapi: request
    else
      render jsonapi_errors: request
    end
  end

  def destroy
    request = RequestResource.find(params)

    if request.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: request
    end
  end
end
