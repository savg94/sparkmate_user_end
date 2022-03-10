class Api::V1::GigsController < Api::V1::GraphitiController
  def index
    gigs = GigResource.all(params)
    respond_with(gigs)
  end

  def show
    gig = GigResource.find(params)
    respond_with(gig)
  end

  def create
    gig = GigResource.build(params)

    if gig.save
      render jsonapi: gig, status: :created
    else
      render jsonapi_errors: gig
    end
  end

  def update
    gig = GigResource.find(params)

    if gig.update_attributes
      render jsonapi: gig
    else
      render jsonapi_errors: gig
    end
  end

  def destroy
    gig = GigResource.find(params)

    if gig.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: gig
    end
  end
end
