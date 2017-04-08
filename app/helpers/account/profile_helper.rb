module Account
  module ProfileHelper
    def avatar_for(user, options = { size: 80 }, name_class)
      size = options[:size]
      if user.avatar?
        image_tag user.avatar.url(:thumb), width: size.to_i, class: name_class 
      else
        image_tag "default-avatar.png", width: size.to_i, class: name_class 
      end
    end

    def navigation_params
      { profile: false, trip: false, car: false, photo: false, messages: false }
    end
  end
end
