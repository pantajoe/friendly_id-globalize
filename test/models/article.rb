class Article < ActiveRecord::Base
  translates :slug, :title, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  extend FriendlyId
  friendly_id :title, use: [:slugged, :globalize]
end
