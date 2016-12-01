module Roo
  module Formatting
    class FloatingPoint < FormatType
      def initialize(options = {})
        format_string= options.fetch(:format_string) { '0.00' }
        format_split = format_string.split('.')
        matches = /(?<precision>\d*).*/.match(format_split[1])

        if matches
          precision = matches['precision'].length
          @format = "%#.#{precision}f"
        end
      end

      def type_symbol
        :float
      end

      def cast_value(value)
        format = @format || calculate_format(value)
        sprintf(format, value).to_f
      end

      def calculate_format(value)
        sign, digits, base, exponent = value.to_d.split
        precision = digits.length - exponent
        "%#.#{precision}f"
      end
    end
  end
end

