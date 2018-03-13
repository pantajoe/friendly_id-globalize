# overwrite setup from friendly_id 5.2.0
module FriendlyId
  module History
    # If the model uses Globalize, it uses the new Globalize History function, otherwise the normal one.
    # Configures the model instance to use the History add-on.
    def self.included(model_class)
      if model_class.friendly_id_config.uses? :globalize
        model_class.class_eval do
          FriendlyId::Globalize::History.setup(model_class)
          include FriendlyId::Globalize::History
        end
      else
        model_class.instance_eval do
          @friendly_id_config.use :slugged
          has_many :slugs, -> { order("#{Slug.quoted_table_name}.id DESC") }, as: :sluggable, dependent: :destroy, class_name: Slug.to_s
          after_save :create_slug
          # relation_class.send :include, FinderMethods
          # friendly_id_config.slug_generator_class.send :include, SlugGenerator
        end
      end
    end
  end
end
