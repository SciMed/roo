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
            Roo::Formatting::FormatGuesser.new.guess_format(format_string)
        end
      end

      private

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
    end
  end
end
