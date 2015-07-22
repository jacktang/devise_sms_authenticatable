module DeviseSmsActivable
  module Generators
    class DeviseSmsAuthenticatableGenerator < Rails::Generators::NamedBase
      namespace "devise_sms_authenticatable"

      desc "Add :sms_authenticatable directive in the given model. Also generate migration for ActiveRecord"

      # def devise_generate_model
      #   invoke "devise", [name]
      # end

      def inject_devise_sms_activable_content
        path = File.join("app", "models", "#{file_path}.rb")
        inject_into_file(path, "sms_authenticatable, :", :after => "devise :") if File.exists?(path)
      end

      hook_for :orm
    end
  end
end