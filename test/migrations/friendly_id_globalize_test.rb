# encoding: utf-8
class FriendlyIdGlobalizeTest < ActiveRecord::Migration
  def self.up
    create_table :texts do |t|
      t.string   :title
      t.string   :slug
    end
    create_table :articles do |t|
      t.string   :name
      t.string   :slug
    end
    create_table :dummies do |t|
      t.string   :name
      t.string   :slug
    end
    Article.create_translation_table! slug: :string, title: :string
    Dummy.create_translation_table!   slug: :string, title: :string
  end
end
