class DeviseSmsAuthenticatableAddTo<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    change_table :<%= table_name %> do |t|
      t.string   :phone
      t.string   :sms_token, :limit => 5
      t.datetime :sms_token_sent_at
      t.datetime :sms_confirmed_at
      t.index    :sms_token # for devise_sms_authenticatable
    end
  end
  
  def self.down
    remove_column :<%= table_name %>, :sms_token
    remove_column :<%= table_name %>, :sms_confirmed_at
    remove_column :<%= table_name %>, :sms_token_sent_at
    remove_column :<%= table_name %>, :phone
  end
end