module Roo
  module Formatting
    class String < FormatType
      def initialize(type_symbol = :string)
        @type_symbol = type_symbol
      end

      def type_symbol
        @type_symbol
      end

      def cast_value(value)
        value
      end
    end
  end
end
