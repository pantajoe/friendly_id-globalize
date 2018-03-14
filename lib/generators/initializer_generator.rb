require 'rails/generators'
# This creates an initializer that override FriendlyId::History#setup,
# so use: [:slugged, :history] will still work properly.
class InitializerGenerator < Rails::Generators::Base

  desc "This creates an initializer that override FriendlyId::History#setup,\n
        so `friendly_id :title, use: [:slugged, :history]` in some models\n
        will still work properly."

  source_root File.expand_path("../templates", __FILE__)

  def copy_initializer_file
    copy_file "history.rb", "config/initializers/history.rb"
  end
end
