# frozen_string_literal: true

require_relative 'acts_as_has_many/version'

module ActsAsHasMany
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_has_many(attribute, options = {})
      validates attribute, associated: true

      column =  options[:attribute].presence || attribute
      klass  =  options[:class_name].presence || attribute.to_s.classify

      define_method(attribute.to_sym) do
        @options ||= read_attribute(column).map do |option|
          klass.constantize.new(option)
        end
      end

      define_method("#{attribute}=".to_sym) do |value|
        write_attribute(column, value.as_json)
      end
    end

    def acts_as_accepts_nested_attributes_for(attribute, _options = {})
      define_method("#{attribute}_attributes=".to_sym) do |associates|
        writeable_associates = associates.values.filter_map do |associate|
          associate.except('_destroy') unless associate['_destroy'].present?
        end

        public_send("#{attribute}=".to_sym, writeable_associates)
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do |base|
  base.include ActsAsHasMany
end
