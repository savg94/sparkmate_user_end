class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  def index
    @chats = Chat.all
  end

  # GET /chats/1
  def show
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: 'Chat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
    redirect_to chats_url, notice: 'Chat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chat_params
      params.require(:chat).permit(:user_id, :provider_id, :message, :gig_id)
    end
end
