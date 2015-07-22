module DeviseSmsAuthenticatable
  module Schema
  
    def sms_authenticatable
      apply_devise_schema :phone,   String
      apply_devise_schema :sms_token,   String, :limit => 5
      apply_devise_schema :sms_token_sent_at, DateTime
      apply_devise_schema :sms_confirmed_at, DateTime
    end
  end
end

#Devise::Schema.send :include, DeviseSmsActivable::Schema
