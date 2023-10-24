# frozen_string_literal: true

require 'models'

RSpec.describe 'ActiveRecord::Base model with #acts_as_accepts_nested_attributes_for called' do
  subject { DummyModel }

  let(:dummy_instance) { DummyModel.new }

  it 'defines setter method' do
    expect(dummy_instance.respond_to?(:class_ones_attributes=)).to be(true)
  end

  it 'sets attributes value' do
    expect { dummy_instance.class_ones_attributes = { '1' => { 'name' => 'class_one' } } }.to change {
                                                                                                dummy_instance.read_attribute(:class_ones)
                                                                                              }.from([]).to([{ 'name' => 'class_one' }])
  end

  it 'filters out hash with _destroy key' do
    expect do
      dummy_instance.class_ones_attributes = { '1' => { 'name' => 'class_one' },
                                               '2' => { 'name' => 'class_two', '_destroy' => true } }
    end.to change {
             dummy_instance.read_attribute(:class_ones)
           }.from([]).to([{ 'name' => 'class_one' }])
  end
end
