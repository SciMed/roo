module Roo
  module Formatting
    class FloatingPoint < FormatType
      def initialize(options = {})
        format_string= options.fetch(:format_string) { '0.00' }
        format_split = format_string.split('.')
        matches = /(?<precision>\d*).*/.match(format_split[1])

        precision =
          if matches
            matches['precision'].length
          else
            2
          end

        @format = "%#.#{precision}f"
      end
      def type_symbol
        :float
      end
      def cast_value(value)
        sprintf(@format, value).to_f
      end
    end
  end
end

