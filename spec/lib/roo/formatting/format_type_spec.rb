require 'spec_helper'

describe Roo::Formatting::FormatType do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :string
    end
  end
  describe '#cast_value' do
    it 'does not transform the value' do
      expect(subject.cast_value(1)).to eql 1
      expect(subject.cast_value('2')).to eql '2'
      expect(subject.cast_value("12/34/56")).to eql "12/34/56"
      expect(subject.cast_value(1.00)).to eql 1.00
    end
  end
end
