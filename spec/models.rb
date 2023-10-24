# frozen_string_literal: true

require 'database_helper'
require 'acts_as_has_many'

class DummyModel < ActiveRecord::Base
  serialize :class_ones, Array
  serialize :class_twos, Array
  serialize :class_threes, Array
  serialize :class_fours, Array

  # class with classfied attribute name exists
  acts_as_has_many :class_ones
  # provided class name exists
  acts_as_has_many :class_twos, class_name: 'ClassTen'
  # class with classfied attribute name does not exist
  acts_as_has_many :class_threes
  # provided class name does not exist
  acts_as_has_many :class_fours, class_name: 'ClassFour'
end

class ClassOne
  include ActiveModel::Model

  attr_accessor :name
end

class ClassTen
  include ActiveModel::Model

  attr_accessor :name
end

def initialize_schema
  initialize_database do
    create_table :dummy_models do |t|
      t.text :class_ones
      t.text :class_twos
      t.text :class_threes
      t.text :class_fours

      t.timestamps null: true
    end
  end
end

initialize_schema
