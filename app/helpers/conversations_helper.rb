module ConversationsHelper
  def mailbox_section(title, current_box, opts = {})
    opts[:class] = opts.fetch(:class, '')
    opts[:class] += ' active' if title.downcase == current_box

    rus_title = ""

    if title == "inbox"
      rus_title = "Входящие"
    elsif title == "sent"
      rus_title = "Исходящие"
    elsif title == "trash"
      rus_title = "Корзина"
    end
    content_tag :li, link_to(rus_title.capitalize, conversations_path(box: title.downcase)), opts
  end
end