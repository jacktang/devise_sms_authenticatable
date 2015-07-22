require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    # Default strategy for signing in a user, based on their email and password in the database.
    class SmsAuthenticatable < Authenticatable
      attr_accessor :sms_token

      def valid?
        valid_for_params_auth?
      end

      def with_authentication_hash(auth_type, auth_values)
        self.authentication_hash, self.authentication_type = {}, auth_type
        self.sms_token = auth_values[:sms_token]

        parse_authentication_key_values(auth_values, authentication_keys) &&
        parse_authentication_key_values(request_values, request_keys)
      end

      def authenticate!
        resource  = sms_token.present? && mapping.to.find_for_sms_authentication(authentication_hash)

        if validate(resource){ resource.valid_sms_token?(sms_token) }
          remember_me(resource)
          resource.after_sms_authentication
          success!(resource)
        end

        fail(:not_found_in_database)
      end
    end
  end
end

Warden::Strategies.add(:sms_authenticatable, Devise::Strategies::SmsAuthenticatable)
