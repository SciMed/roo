module Roo
  module Roo::Formatting
    class FormatTypeFactory
      def self.from_string(format_string, base_date)
        type_class = new.type_class(format_string)
        type_class.new(:base_date => base_date, :format_string => format_string)
      end

      def type_class(format_string)
        case format_string
          when float_format_pattern
            Roo::Formatting::FloatingPoint
          when percent_format_pattern
            Roo::Formatting::Percent
          when fraction_format_pattern
            Roo::Formatting::Fraction
          when int_format_pattern
            Roo::Formatting::Integer
          else
            class_from_map = type_map[format_string]

            unless class_from_map
              puts "format: #{format_string}"
              class_from_map = Roo::Formatting::FloatingPoint
            end

            class_from_map
        end
      end

      def float_format_pattern
        /\A[[#,]*\d+]*\.[^%]+\z/
      end

      def percent_format_pattern
        /\A[#,\d\.]*%\z/
      end

      def fraction_format_pattern
        /\A[#,\s]*[\d\?]+\/[\d\?]+\z/
      end

      def int_format_pattern
        /\A[#,]*\d+((?!\.)[^%\n]+)?\z/
      end

      #TODO determine if it is safe to downcase these to reduce duplication in the map keys
      #TODO determine if this handles all of the edge cases here
      def type_map
        {
          'General' => Roo::Formatting::General,

          '@' => Roo::Formatting::FloatingPoint,
          # '0.00' => Roo::Formatting::FloatingPoint,
          # '#,##0.00;(#,##0.00)' => Roo::Formatting::FloatingPoint,
          # '#,##0.00;[Red](#,##0.00)' => Roo::Formatting::FloatingPoint,
          # '##0.0E+0' => Roo::Formatting::FloatingPoint,
          # '0.00E+00' => Roo::Formatting::FloatingPoint,
          # '#,##0.00' => Roo::Formatting::FloatingPoint,

          # '0' => Roo::Formatting::Integer,
          # '#,##0' => Roo::Formatting::Integer,
          # '#,##0 ;(#,##0)' => Roo::Formatting::Integer,
          # '#,##0 ;[Red](#,##0)' => Roo::Formatting::Integer,
          # '#,##0_);[Red](#,##0)' => Roo::Formatting::Integer,
          # '#0_);[Red]\(0\)' => Roo::Formatting::Integer,

          # '0%' => Roo::Formatting::Percent,
          # '0.00%' => Roo::Formatting::Percent,

          # '# ?/?' => Roo::Formatting::Fraction,
          # '# ??/??' => Roo::Formatting::Fraction,

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
        }
      end
    end
  end
end
