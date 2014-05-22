require 'spec_helper'

describe Roo::Formatting::Boolean do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :boolean
    end
  end
  describe '#cast_value' do
    context 'truthy value' do
      it 'returns "TRUE"' do
        expect(subject.cast_value(1)).to eql 'TRUE'
        expect(subject.cast_value(true)).to eql 'TRUE'
        expect(subject.cast_value('true')).to eql 'TRUE'
        expect(subject.cast_value('TRUE')).to eql 'TRUE'
        expect(subject.cast_value(Object.new)).to eql 'TRUE'
      end
    end
    context 'falsy value' do
      it 'returns "FALSE"' do
        expect(subject.cast_value(0)).to eql 'FALSE'
        expect(subject.cast_value(false)).to eql 'FALSE'
        expect(subject.cast_value('false')).to eql 'FALSE'
        expect(subject.cast_value('FALSE')).to eql 'FALSE'
        expect(subject.cast_value(nil)).to eql 'FALSE'
      end
    end
  end
end
