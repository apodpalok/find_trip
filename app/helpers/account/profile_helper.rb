module Account
  module ProfileHelper
    def navigation_params
      { profile: false, trip: false, car: false, photo: false, messages: false, settings: false, security: false }
    end
  end
end
