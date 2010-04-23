require 'salty_slugs/utils'
require 'salty_slugs/active_record'

ActiveRecord::Base.send(:include, Norbauer::SaltySlugs)
