require 'spec_helper'

describe Roo::Formatting::Time do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :time
    end
  end
  describe '#cast_value' do
    it 'transforms the value to a date string' do
      expect(subject.cast_value(0)).to eql '00:00:00'
      expect(subject.cast_value(0.5)).to eql '12:00:00'
      expect(subject.cast_value('.25')).to eql '06:00:00'
    end
  end
end
