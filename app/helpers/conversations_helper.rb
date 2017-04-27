module ConversationsHelper
  def mailbox_section(title, current_box, opts = {})
    opts[:class] = opts.fetch(:class, '')
    opts[:class] += ' active' if title.downcase == current_box
    opts[:class]
  end
end
