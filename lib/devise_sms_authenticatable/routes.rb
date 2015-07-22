module ActionDispatch::Routing
  class Mapper

    protected
      def devise_sms_session(mapping, controllers)
        resource :sms_session,  only: [], :path => mapping.path_names[:sms_session], :controller => controllers[:sms_sessions] do
          get   :new,     path: mapping.path_names[:sign_in],  as: "new"
          post  :create,  path: mapping.path_names[:sign_in]
          match :destroy, path: mapping.path_names[:sign_out], as: "destroy", via: mapping.sign_out_via
          get :resend,    path: mapping.path_names[:resend], as: "resend"
          post :send_sms, path: mapping.path_names[:send_sms], as: "send_sms"
        end
      end

  end
end