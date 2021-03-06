# encoding: utf-8
begin
  require "unicode"
rescue LoadError
  require "iconv"
end

module SaltySlugs
  module Utils
    def self.sluggify(text)
      return nil if text.blank?
      
      if defined?(Transliteration)
      	str = Transliteration.transliterate(text)
      	str = str.gsub(/\W+/, '-').gsub(/^-+/,'').gsub(/-+$/,'').downcase
        return str
      elsif defined?(Unicode)
        str = Unicode.normalize_KD(text).gsub(/[^\x00-\x7F]/n,'')
        str = str.gsub(/\W+/, '-').gsub(/^-+/,'').gsub(/-+$/,'').downcase
        return str
      else
        str = Iconv.iconv('ascii//translit//ignore', 'utf-8', text).to_s
        str.gsub!(/\W+/, ' ')
        str.strip!
        str.downcase!
        str.gsub!(/\ +/, '-')
        return str
      end
    end
  end
end
