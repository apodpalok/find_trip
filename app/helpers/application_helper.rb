module ApplicationHelper
  def avatar_for(user, options = { size: 250 })
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size.to_i 
    else
      image_tag "default-avatar.png", width: size.to_i
    end
  end
end
