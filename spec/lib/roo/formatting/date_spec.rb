require 'spec_helper'

describe Roo::Formatting::Date do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :date
    end
  end
  describe '#cast_value' do
    context 'default base date' do
      it 'transforms the value to a date string offset from 1899-12-30' do
        expect(subject.cast_value(0)).to eql '1899-12-30'
        expect(subject.cast_value(11)).to eql '1900-01-10'
      end
    end
    context 'non-default base date' do
      it 'transforms the value to a date string offset from the base date' do
        date_format = Roo::Formatting::Date.new(base_date: Date.new(2000,01,01))
        expect(date_format.cast_value(0)).to eql '2000-01-01'
        expect(date_format.cast_value(376)).to eql '2001-01-11'
      end
    end
  end
end
