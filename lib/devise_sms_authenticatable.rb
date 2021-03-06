require "devise"

$: << File.expand_path("..", __FILE__)

require 'devise_sms_authenticatable/routes'
require 'devise_sms_authenticatable/schema'
require 'devise_sms_authenticatable/controllers/url_helpers'
require 'devise_sms_authenticatable/controllers/helpers'
require 'devise_sms_authenticatable/rails'

module Devise
  mattr_accessor :sms_confirm_within
  @@sms_confirm_within = 2.days
  mattr_accessor :sms_confirmation_keys
  @@sms_confirmation_keys = [:email]

  # Get the sms sender class from the mailer reference object.
  def self.sms_sender
    @@sms_sender_ref.get 'Devise::SmsSender'
  end

  # Set the smser reference object to access the smser.
  def self.sms_sender=(class_name)
    @@sms_sender_ref = ActiveSupport::Dependencies.reference(class_name)
  end

  self.sms_sender = "Devise::SmsSender"
end

Devise.add_module :sms_authenticatable, :model => "models/sms_authenticatable", :controller => :sms_sessions, :route => {sms_session: [nil, :new, :resend, :send]}, :strategy => true
