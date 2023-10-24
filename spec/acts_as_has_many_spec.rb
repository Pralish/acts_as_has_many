# frozen_string_literal: true

require 'models'
require 'pry'

RSpec.describe 'ActiveRecord::Base model with #acts_as_has_many called' do
  subject { DummyModel }

  let(:dummy_instance) do
    DummyModel.new(
      class_ones: [{ name: 'test' }],
      class_twos: [{ name: 'test' }],
      class_threes: [{ name: 'test' }],
      class_fours: [{ name: 'test' }]
    )
  end

  context 'when class_name is not provided' do
    context 'when class with classified attribute name exists' do
      it 'returns an array of instances of class' do
        expect(dummy_instance.class_ones).to all(be_instance_of(ClassOne))
      end
    end

    context 'when class with classified attribute name does not exist' do
      it 'raises error' do
        expect { dummy_instance.class_threes }.to raise_error(NameError)
      end
    end
  end

  context 'when class_name provided' do
    context 'when provided class exists' do
      it 'returns an array of instances of class' do
        expect(dummy_instance.class_twos).to all(be_instance_of(ClassTen))
      end
    end

    context 'when provided class does not exist' do
      it 'raises error' do
        expect { dummy_instance.class_fours }.to raise_error(NameError)
      end
    end
  end
end
