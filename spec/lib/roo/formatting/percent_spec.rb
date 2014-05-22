require 'spec_helper'

describe Roo::Formatting::Percent do
  describe '#type_symbol' do
    it 'returns the type symbol for this format' do
      expect(subject.type_symbol).to be :percentage
    end
  end
end
