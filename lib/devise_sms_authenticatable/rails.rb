module DeviseInvitable
  class Engine < ::Rails::Engine

    ActiveSupport.on_load(:action_controller) { include DeviseSmsAuthenticatable::Controllers::UrlHelpers }
    ActiveSupport.on_load(:action_view)       { include DeviseSmsAuthenticatable::Controllers::UrlHelpers }

    config.after_initialize do
    
    end

  end
end
