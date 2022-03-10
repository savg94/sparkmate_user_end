class ChatsController < ApplicationController
  before_action :current_user_must_be_chat_user,
                only: %i[edit update destroy]

  before_action :set_chat, only: %i[show edit update destroy]

  # GET /chats
  def index
    @q = current_user.chats.ransack(params[:q])
    @chats = @q.result(distinct: true).includes(:user, :provider,
                                                :gig).page(params[:page]).per(10)
  end

  # GET /chats/1
  def show; end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit; end

  # POST /chats
  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      message = "Chat was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @chat, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
    message = "Chat was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to chats_url, notice: message
    end
  end

  private

  def current_user_must_be_chat_user
    set_chat
    unless current_user == @chat.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def chat_params
    params.require(:chat).permit(:user_id, :provider_id, :message, :gig_id)
  end
end
