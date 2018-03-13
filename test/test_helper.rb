# encoding: utf-8
require 'pry'
require 'bundler/setup'
require 'active_record'
require 'friendly_id'
require 'friendly_id/globalize'
require 'globalize'
require 'minitest/autorun'
require_relative 'migrations/create_friendly_id_slugs'
require_relative 'migrations/friendly_id_globalize_test'
require_relative 'models/article'
require_relative 'models/dummy'
require_relative 'models/text'
require_relative 'helpers/module'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
::I18n.enforce_available_locales = false
Globalize.fallbacks = {:en => [:en, :de], :de => [:de, :en]}

ActiveRecord::Migration.verbose = false
FriendlyIdGlobalizeTest.up
CreateFriendlyIdSlugs.up

def transaction
  ActiveRecord::Base.transaction { yield ; raise ActiveRecord::Rollback }
end

def with_instance_of(*args)
  model_class = args.shift
  args[0] ||= {:name => "a b c"}
  transaction { yield model_class.create!(*args) }
end
