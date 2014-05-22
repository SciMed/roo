module Roo
  module Formatting
    class Integer < FormatType
      def type_symbol
        :integer
      end
      def cast_value(value)
        value.to_i
      end
    end
  end
end
