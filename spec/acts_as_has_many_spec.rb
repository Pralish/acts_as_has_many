# frozen_string_literal: true

require 'models'

RSpec.describe 'ActiveRecord::Base model with #acts_as_has_many called' do
  subject { DummyModel }

  let(:dummy_instance) do
    DummyModel.new(
      class_ones: [{ name: 'class one' }],
      class_twos: [{ name: 'class two' }],
      class_threes: [{ name: 'class three' }],
      class_fours: [{ name: 'class four' }]
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

  context 'valid attribute provided' do
    it 'defines a getter method' do
      expect(dummy_instance.respond_to?(:class_fives)).to be(true)
    end

    it 'returns an array of instances of has_many class' do
      expect(dummy_instance.class_fives).to all(be_instance_of(ClassFive))
    end

    it 'returns value of provided attribute' do
      expect(dummy_instance.class_fives.first.name).to eq('class one')
    end
  end

  context 'invalid attribute provided' do
    it 'defines a getter method' do
      expect(dummy_instance.respond_to?(:class_sixes)).to be(true)
    end

    it 'raises error' do
      expect { dummy_instance.class_sixes }.to raise_error(NameError)
    end
  end
end
