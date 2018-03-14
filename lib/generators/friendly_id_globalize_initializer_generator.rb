require 'rails/generators'

class FriendlyIdGlobalizeInitializerGenerator < Rails::Generators::Base

  desc "This creates an initializer that override FriendlyId::History#setup,\n
        so `friendly_id :title, use: [:slugged, :history]` in some models\n
        will still work properly."

  source_root File.expand_path("../../templates", __FILE__)

  def copy_initializer_file
    copy_file "history.rb", "config/initializers/friendly_id_globalize_history.rb"
  end
end
