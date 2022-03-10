class GigsController < ApplicationController
  before_action :set_gig, only: %i[show edit update destroy]

  def index
    @q = Gig.ransack(params[:q])
    @gigs = @q.result(distinct: true).includes(:request, :provider,
                                               :chats).page(params[:page]).per(10)
  end

  def show
    @chat = Chat.new
  end

  def new
    @gig = Gig.new
  end

  def edit; end

  def create
    @gig = Gig.new(gig_params)

    if @gig.save
      message = "Gig was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @gig, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @gig.update(gig_params)
      redirect_to @gig, notice: "Gig was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @gig.destroy
    message = "Gig was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to gigs_url, notice: message
    end
  end

  private

  def set_gig
    @gig = Gig.find(params[:id])
  end

  def gig_params
    params.require(:gig).permit(:request_id, :provider_id, :status)
  end
end
