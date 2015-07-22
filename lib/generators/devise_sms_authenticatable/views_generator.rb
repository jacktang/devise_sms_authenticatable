require 'generators/devise/views_generator'

module DeviseSmsAuthenticatable
  module Generators
    class ViewsGenerator < Devise::Generators::ViewsGenerator
      source_root File.expand_path("../../../../app/views", __FILE__)
      desc 'Copies all DeviseSmsAuthenticatable views to your application.'
    end
  end
end