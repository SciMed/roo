require 'spec_helper'

describe Roo::Formatting::FormatGuesser do
  describe '#guess_format' do
    it 'guesses the format of mapped classes' do
      {
        'General' => Roo::Formatting::General,

        '@' => Roo::Formatting::FloatingPoint,

        'mm-dd-yy' => Roo::Formatting::Date,
        'd-mmm-yy' => Roo::Formatting::Date,
        'd-mmm' => Roo::Formatting::Date,
        'mmm-yy' => Roo::Formatting::Date,
        'yyyy\\-mm\\-dd' => Roo::Formatting::Date,
        'dd/mm/yy' => Roo::Formatting::Date,
        'dd/mmm/yy' => Roo::Formatting::Date,
        'yyyy-mm-dd' => Roo::Formatting::Date,
        'yyyy-mm-dd;@' => Roo::Formatting::Date,

        'm/d/yy h:mm' => Roo::Formatting::DateTime,
        'dd/mm/yy\\ hh:mm' => Roo::Formatting::DateTime,
        'dd/mmm/yy\\ hh:mm' => Roo::Formatting::DateTime,

        'h:mm AM/PM' => Roo::Formatting::Time,
        'h:mm:ss AM/PM' => Roo::Formatting::Time,
        'h:mm' => Roo::Formatting::Time,
        'h:mm:ss' => Roo::Formatting::Time,
        'hh:mm:ss' => Roo::Formatting::Time,
        'h:mm am/pm' => Roo::Formatting::Time,
        'h:mm:ss am/pm' => Roo::Formatting::Time,
        '[h]:mm:ss' => Roo::Formatting::Time,
        'mmss.0' => Roo::Formatting::Time,
        'mm:ss' => Roo::Formatting::Time,
      }.each do |format_string, format_class|
        expect(subject.guess_format(format_string)).to eql format_class
      end
    end
    it 'guesses the format of non-standard dates' do
      expect(subject.guess_format('[$-409]dd\-mmm\-yy;@')).to eql Roo::Formatting::Date
      expect(subject.guess_format('[$-409]mmm\\-yy;@')).to eql Roo::Formatting::Date
      expect(subject.guess_format('m/d/yyyy;@')).to eql Roo::Formatting::Date
    end
    it 'guesses the format of non-standard date-times' do
      expect(subject.guess_format('[$-409]dd\-mmm\-yy hh:mm:ss;@')).to eql Roo::Formatting::DateTime
      expect(subject.guess_format('m/d/yyyy hh:mm:ss;@')).to eql Roo::Formatting::DateTime
    end
    it 'guesses the format of non-standard times' do
      expect(subject.guess_format('[$-409]hh:mm:ss;@')).to eql Roo::Formatting::Time
      expect(subject.guess_format('[] hh:mm:ss;@')).to eql Roo::Formatting::Time
    end
    it 'returns the General format for formats it cannot guess' do
      expect(subject.guess_format('UNKNOWN FORMAT')).to eql Roo::Formatting::General
    end
  end
end
