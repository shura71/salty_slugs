module Norbauer
  module SaltySlugs
    def self.included(base)
      base.extend SlugMethods
    end

    module SlugMethods
      # Configuration options are:
      #   :slug_column - column for save slug
      #   :source_column - source column for generate slug
      #   :prepend_id - method to_param return ':id-:slug' or ':slug'
      #   :sync_slug - regenerate slug on record update
      #   :scope - for validation
      #
      # Usage:
      # class Post < ActiveRecord::Base
      #   has_slug :slug_column => 'permalink', :source_column => 'name'
      # end
      # 
      def has_slug(options = {})
        unless included_modules.include? InstanceMethods
          extend ClassMethods
          extend Columns
          include InstanceMethods
          include Columns
        end

        options = {
            :slug_column => 'slug',
            :source_column => 'title',
            :prepend_id => true,
            :sync_slug => false,
            :scope => nil
          }.merge(options)
        
        if options[:scope].is_a?(Symbol) && options[:scope].to_s !~ /_id$/
          options[:scope] = "#{options[:scope]}_id".intern
        end
        
        write_inheritable_attribute :salty_slugs_options, options
        class_inheritable_reader :salty_slugs_options

        unless slug_prepend_id
          slug_scope_fields ? (validates_uniqueness_of slug_column, :scope => slug_scope_fields) : (validates_uniqueness_of slug_column)
        end

        before_validation { |record| record[slug_column] = (sync_slug || record[slug_column].blank?) ? Norbauer::Utils.sluggify(record.send(slug_source_column)) : Norbauer::Utils.sluggify(record[slug_column]) }
      end

      module ClassMethods
        def slugged_find(value, options = {})
          if slug_prepend_id && value.to_i != 0
            find(value.to_i, options)
          else
            with_scope(:find => { :conditions => { slug_column => value } }) do
              find(:first, options)
            end or raise ::ActiveRecord::RecordNotFound
          end
        end
      end

      module Columns
        def slug_column
          salty_slugs_options[:slug_column]
        end
        
        def slug_source_column
          salty_slugs_options[:source_column]
        end
        
        def slug_prepend_id
          salty_slugs_options[:prepend_id]
        end
        
        def sync_slug
          salty_slugs_options[:sync_slug]
        end
        
        def slug_scope_fields
          salty_slugs_options[:scope]
        end
      end
      
      module InstanceMethods
        def to_param
          return self.id.to_s if self[slug_column].blank?
          slug_prepend_id ? "#{self.id}-#{self[slug_column]}" : self[slug_column]
        end
      end
    end
  end
end
