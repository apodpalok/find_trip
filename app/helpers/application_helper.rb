module ApplicationHelper
  def avatar_for(user, options = { size: 250 })
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size.to_i 
    else
      image_tag "default-avatar.png", width: size.to_i
    end
  end

  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-success"
      when :info then "alert alert-info"
      when :alert then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end
end
