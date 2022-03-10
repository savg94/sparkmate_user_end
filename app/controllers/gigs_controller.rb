class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  # GET /gigs
  def index
    @gigs = Gig.all
  end

  # GET /gigs/1
  def show
  end

  # GET /gigs/new
  def new
    @gig = Gig.new
  end

  # GET /gigs/1/edit
  def edit
  end

  # POST /gigs
  def create
    @gig = Gig.new(gig_params)

    if @gig.save
      redirect_to @gig, notice: 'Gig was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      redirect_to @gig, notice: 'Gig was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
    redirect_to gigs_url, notice: 'Gig was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig
      @gig = Gig.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gig_params
      params.require(:gig).permit(:request_id, :provider_id, :status)
    end
end