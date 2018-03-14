# encoding: utf-8
class CreateFriendlyIdSlugs < ActiveRecord::Migration

  def self.up
    create_table :friendly_id_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 50
      t.string   :scope
      t.string   :locale,         length: 2, null: :false, after: :scope
      t.datetime :created_at
    end
    add_index :friendly_id_slugs, :sluggable_id
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :locale], length: { slug: 140, sluggable_type: 50, locale: 2 }
    add_index :friendly_id_slugs, :sluggable_type
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope, :locale], length: { slug: 70, sluggable_type: 50, scope: 70, locale: 2 }, unique: true, name: :index_friendly_id_slugs_uniqueness
    add_index :friendly_id_slugs, :locale
  end

  def self.down
    drop_table :friendly_id_slugs
  end
end
