require 'spec_helper'

describe Roo::Formatting::DateTime do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :datetime
    end
  end
  describe '#cast_value' do
    context 'default base date' do
      it 'transforms the value to a date-time string offset from 1899-12-30' do
        expect(subject.cast_value(0)).to eql '1899-12-30 00:00:00.000000000'
        expect(subject.cast_value(11)).to eql '1900-01-10 00:00:00.000000000'
        expect(subject.cast_value(32.525)).to eql '1900-01-31 12:36:00.000000000'
      end
    end
    context 'non-default base date' do
      it 'transforms the value to a date string offset from the base date' do
        date_format = Roo::Formatting::DateTime.new(base_date: Date.new(2000,01,01))
        expect(date_format.cast_value(0)).to eql '2000-01-01 00:00:00.000000000'
        expect(date_format.cast_value(11)).to eql '2000-01-12 00:00:00.000000000'
        expect(date_format.cast_value(32.525)).to eql '2000-02-02 12:36:00.000000000'
      end
    end
  end
end
