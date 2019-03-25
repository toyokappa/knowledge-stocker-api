require 'active_support/core_ext'

class Hash
  unless method_defined?(:jsonize_keys)
    def jsonize_keys(first_letter = :lower)
      transform_keys do |key|
        sanitize_key = key.to_s.gsub(/\?!/, '')
        sanitize_key.camelize(first_letter)
      rescue
        key
      end
    end
  end
end
