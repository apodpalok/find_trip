module ApplicationHelper
  def avatar_for(user, options = { width: 250, height: 300, class: '' })
    width = options[:width]
    height = options[:height]
    if user.avatar?
      image_tag user.avatar.url(:medium), width: width.to_i, height: height.to_i, class: options[:class]
    else
      image_tag 'default-avatar.png', width: width.to_i, height: height.to_i, class: options[:class]
    end
  end

  def flash_class(level)
    case level.to_sym
    when :notice then 'alert alert-success'
    when :info then 'alert alert-info'
    when :alert then 'alert alert-danger'
    when :warning then 'alert alert-warning'
    end
  end

  def select_gender
    [['Мужской', :male], ['Женский', :female]]
  end

  def show_select(obj_attribute, select_type)
    count = 0
    select_type.each do |collection|
      collection.each do |attribute|
        return select_type[count].first if attribute == obj_attribute.to_sym
      end
      count += 1
    end
    ''
  end
end
