# encoding: utf-8
module SaltySlugs
  autoload :Transliteration, 'salty_slugs/transliteration'
  autoload :Utils,           'salty_slugs/utils'
  autoload :ActiveRecord,    'salty_slugs/active_record'
end

require 'salty_slugs/railtie'
