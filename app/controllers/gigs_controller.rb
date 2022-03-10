class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  # GET /gigs
  def index
    @gigs = Gig.all
  end

  # GET /gigs/1
  def show
    @chat = Chat.new
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
      message = 'Gig was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @gig, notice: message
      end
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
    message = "Gig was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to gigs_url, notice: message
    end
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
