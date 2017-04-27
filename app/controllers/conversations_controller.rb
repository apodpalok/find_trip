class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :take_box, only: [:index]
  before_action :take_mailbox
  before_action :take_conversation, except: [:index, :empty_trash]

  def index
    @conversations = if @box.eql? 'inbox'
                       @mailbox.inbox
                     elsif @box.eql? 'sent'
                       @mailbox.sentbox
                     else
                       @mailbox.trash
                     end

    @conversations = @conversations.page(params[:page]).per(10)
  end

  def show; end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_user).update_all(deleted: true)
    end
    flash[:success] = 'Your trash was cleaned!'
    redirect_to conversations_path
  end

  def mark_as_read
    @conversation.mark_as_read(current_user)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(current_user)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def destroy
    @conversation.move_to_trash(current_user)
    flash[:success] = 'The conversation was moved to trash.'
    redirect_to conversations_path
  end

  private

  def take_box
    if params[:box].blank? || !%w[inbox sent trash].include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end

  def take_mailbox
    @mailbox ||= current_user.mailbox
  end

  def take_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end
