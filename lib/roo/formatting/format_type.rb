module Roo
  module Formatting
    class FormatType
      def initialize(options = {})
      end

      def type_symbol
        :string
      end

      def cast_value(value)
        value
      end
    end
  end
end
