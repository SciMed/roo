require 'spec_helper'

describe Roo::Formatting::Fraction do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :fraction
    end
  end
end
