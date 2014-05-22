require 'spec_helper'

describe Roo::Formatting::FloatingPoint do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :float
    end
  end
  describe '#cast_value' do
    context 'default format' do
      it 'transforms the value to a floating point number with a precision of 2' do
        expect(subject.cast_value(1)).to eql 1.00
        expect(subject.cast_value('2')).to eql 2.00
        expect(subject.cast_value("2.344")).to eql 2.34
        expect(subject.cast_value("2.349")).to eql 2.35
        expect(subject.cast_value(1.00)).to eql 1.00
      end
    end
    context 'non-default format' do
      it 'transforms the value to a floating point number' do
        float_format = described_class.new(format_string: '0.0; (0.0)')
        expect(float_format.cast_value(1)).to eql 1.0
        expect(float_format.cast_value('2')).to eql 2.0
        expect(float_format.cast_value("2.344")).to eql 2.3
        expect(float_format.cast_value("2.38")).to eql 2.4
        expect(float_format.cast_value(1.00)).to eql 1.0
      end
    end
  end
end
