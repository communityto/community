class PersonalMessagesController < ApplicationController

  before_action :find_conversation!
  before_action :require_login

  def new
      redirect_to user_conversation_path(current_user, @conversation) and return if @conversation
      @users = User.all
      @personal_message = current_user.personal_messages.build
  end


  def create
    @conversation ||= Conversation.create(author_id: current_user.id,
                                          receiver_id: @receiver.id)

    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!

    flash[:success] = "Your message was sent!"
    redirect_to user_conversation_path(current_user, @conversation)
  end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  def find_conversation!
    if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      redirect_to(root_path) and return unless @receiver
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    else
      @conversation = Conversation.find_by(params[:conversation_id])
      redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
    end
  end
end
