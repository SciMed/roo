require 'spec_helper'

describe Roo::Formatting::Integer do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :integer
    end
  end
  describe '#cast_value' do
    it 'transforms the value to an integer number' do
      expect(subject.cast_value(1)).to eql 1
      expect(subject.cast_value('2')).to eql 2
      expect(subject.cast_value("2.344")).to eql 2
      expect(subject.cast_value(1.00)).to eql 1
    end
  end
end
