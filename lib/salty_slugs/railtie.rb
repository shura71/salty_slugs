# encoding: utf-8
require 'rails'
require 'salty_slugs'

module SaltySlugs
  class Railtie < Rails::Railtie
    config.before_initialize do
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Base.send(:include, SaltySlugs::ActiveRecord)
      end
    end
  end
end
