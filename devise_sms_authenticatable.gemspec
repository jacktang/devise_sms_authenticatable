# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'devise_sms_authenticatable/version'

Gem::Specification.new do |s|
  s.name         = "devise_sms_authenticatable"
  s.version      = DeviseSmsAuthenticatable::VERSION.dup
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Rémi Jarasson"]
  s.email        = ["remi.jarasson@gmail.com"]
  s.homepage     = "https://github.com/artistix/devise_sms_authenticatable"
  s.summary      = "An SMS based authentication strategy for Devise"
  s.description  = "It adds support for sending authentication tokens via SMS and sign in with them."
  s.files        = Dir["{app,config,lib}/**/*"] + %w[LICENSE README.rdoc]
  s.require_path = "lib"
  s.rdoc_options = ["--main", "README.rdoc", "--charset=UTF-8"]
  
  s.required_ruby_version     = '>= 1.8.6'
  s.required_rubygems_version = '>= 1.3.6'
  
  {
    'bundler'     => '~> 1.0.7',
    'rspec-rails' => '~> 2.5.0'
  }.each do |lib, version|
    s.add_development_dependency(lib, version)
  end
  
  {
    'rails'  => '>= 3.2.0',
    'devise' => '>= 3.1.0'
  }.each do |lib, version|
    s.add_runtime_dependency(lib, version)
  end
  
end
