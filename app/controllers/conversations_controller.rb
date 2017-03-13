class ConversationsController < ApplicationController

  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show
    @personal_message = current_user.personal_messages.build
  end

  def reply
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!

    flash[:success] = "Your message was sent!"
    redirect_to user_conversation_path(current_user, @conversation)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end
end
