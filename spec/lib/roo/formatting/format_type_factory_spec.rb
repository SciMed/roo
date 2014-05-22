require 'spec_helper'

describe Roo::Formatting::FormatTypeFactory do
  describe '.from_string' do
    it 'handles guessing for general formatting' do
      expect(described_class.from_string('General', {})).to be_a Roo::Formatting::General
    end
    it 'handles floating point type formats' do
      floating_point_formats = {
        '0.00' => Roo::Formatting::FloatingPoint,
        '#,##0.00' => Roo::Formatting::FloatingPoint,
        '0.00E+00' => Roo::Formatting::FloatingPoint,
        '#,##0.00;(#,##0.00)' => Roo::Formatting::FloatingPoint,
        '#,##0.00;[Red](#,##0.00)' => Roo::Formatting::FloatingPoint,
        '##0.0E+0' => Roo::Formatting::FloatingPoint,
        '@' => Roo::Formatting::FloatingPoint,
      }
      floating_point_formats.each do |format_string, type_class|
        expect(described_class.from_string(format_string, {})).to be_a type_class
      end
    end
    it "handles integer type formats" do
      integer_formats = {
        '0' => Roo::Formatting::Integer,
        '#,##0' => Roo::Formatting::Integer,
        '#,##0 ;(#,##0)' => Roo::Formatting::Integer,
        '#,##0 ;[Red](#,##0)' => Roo::Formatting::Integer,
        '#,##0_);[Red](#,##0)' => Roo::Formatting::Integer,
        '#0_);[Red]\(0\)' => Roo::Formatting::Integer
      }
      integer_formats.each do |format_string, type_class|
        expect(described_class.from_string(format_string, {})).to be_a type_class
      end
    end
    it 'handles percentage type formats' do
      percentage_formats = {
        '0%' => Roo::Formatting::Percent,
        '0.00%' => Roo::Formatting::Percent,
      }
      percentage_formats.each do |format_string, type_class|
        expect(described_class.from_string(format_string, {})).to be_a type_class
      end
    end
    it 'handles fraction type formats' do
      percentage_formats = {
        '# ?/?' => Roo::Formatting::Fraction,
        '# ??/??' => Roo::Formatting::Fraction,
      }
      percentage_formats.each do |format_string, type_class|
        expect(described_class.from_string(format_string, {})).to be_a type_class
      end
    end
    it 'handles date type formats' do
      date_formats = {
        'mm-dd-yy' => Roo::Formatting::Date,
        'd-mmm-yy' => Roo::Formatting::Date,
        'd-mmm' => Roo::Formatting::Date,
        'mmm-yy' => Roo::Formatting::Date,
        "yyyy\\-mm\\-dd" => Roo::Formatting::Date,
        'dd/mm/yy' => Roo::Formatting::Date,
        'dd/mmm/yy' => Roo::Formatting::Date,
        'yyyy-mm-dd' => Roo::Formatting::Date,
        'yyyy-mm-dd;@' => Roo::Formatting::Date,
        '[$-409]dd\-mmm\-yy;@' => Roo::Formatting::Date
      }
      date_formats.each do |format_string, type_class|
        expect(described_class.from_string(format_string, {})).to be_a type_class
      end
    end
    it 'handles date-time type formats' do
      date_time_formats = {
        'm/d/yy h:mm' => Roo::Formatting::DateTime,
        "dd/mm/yy\\ hh:mm" => Roo::Formatting::DateTime,
        'dd/mmm/yy\\ hh:mm' => Roo::Formatting::DateTime,
      }
      date_time_formats.each do |format_string, type_class|
        expect(described_class.from_string(format_string, {})).to be_a type_class
      end
    end
    it 'handles time type formats' do
      time_formats = {
        'h:mm AM/PM' => Roo::Formatting::Time,
        'h:mm:ss AM/PM' => Roo::Formatting::Time,
        'h:mm:ss am/pm' => Roo::Formatting::Time,
        'h:mm:ss am/pm' => Roo::Formatting::Time,
        'h:mm' => Roo::Formatting::Time,
        'h:mm:ss' => Roo::Formatting::Time,
        'mm:ss' => Roo::Formatting::Time,
        '[h]:mm:ss' => Roo::Formatting::Time,
        'mmss.0' => Roo::Formatting::Time,
        'hh:mm:ss' => Roo::Formatting::Time,
      }
      time_formats.each do |format_string, type_class|
        expect(described_class.from_string(format_string, {})).to be_a type_class
      end
    end
  end
end
