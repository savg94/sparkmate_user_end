class Api::V1::ProvidersController < Api::V1::GraphitiController
  def index
    providers = ProviderResource.all(params)
    respond_with(providers)
  end

  def show
    provider = ProviderResource.find(params)
    respond_with(provider)
  end

  def create
    provider = ProviderResource.build(params)

    if provider.save
      render jsonapi: provider, status: 201
    else
      render jsonapi_errors: provider
    end
  end

  def update
    provider = ProviderResource.find(params)

    if provider.update_attributes
      render jsonapi: provider
    else
      render jsonapi_errors: provider
    end
  end

  def destroy
    provider = ProviderResource.find(params)

    if provider.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: provider
    end
  end
end
