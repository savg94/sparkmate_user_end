class Api::V1::ChatsController < Api::V1::GraphitiController
  def index
    chats = ChatResource.all(params)
    respond_with(chats)
  end

  def show
    chat = ChatResource.find(params)
    respond_with(chat)
  end

  def create
    chat = ChatResource.build(params)

    if chat.save
      render jsonapi: chat, status: 201
    else
      render jsonapi_errors: chat
    end
  end

  def update
    chat = ChatResource.find(params)

    if chat.update_attributes
      render jsonapi: chat
    else
      render jsonapi_errors: chat
    end
  end

  def destroy
    chat = ChatResource.find(params)

    if chat.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: chat
    end
  end
end
