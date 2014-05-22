module Roo
  module Formatting
    class Percent < FormatType
      def type_symbol
        :percentage
      end
      def cast_value(value)
        value.to_f
      end
    end
  end
end
