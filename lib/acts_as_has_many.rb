# frozen_string_literal: true

require_relative "acts_as_has_many/version"

module ActsAsHasMany
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_has_many(attribute, options = {})
      validates attribute, associated: true

      column =  options[:attribute].presence || attribute
      klass  =  options[:class_name].presence || attribute.classify
            
      define_method(attribute) do
        @options ||= read_attribute(column).map do |option|
          klass.constantize.new(option)
        end
      end

      define_method("#{attribute}=".to_sym) do |value|
        write_attribute(attribute, value.as_json)
      end

      define_method("#{attribute}_attributes=".to_sym) do |associates|
        write_attribute(attribute, associates.values)
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do |base|
  base.include ActsAsHasMany
end
