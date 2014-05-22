module Roo
  module Formatting
    class Fraction < FormatType
      def type_symbol
        :fraction
      end
      def cast_value(value)
        value.to_f
      end
    end
  end
end
