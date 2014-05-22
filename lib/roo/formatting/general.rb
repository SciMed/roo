module Roo
  module Formatting
    class General < FormatType
      def initialize(options = {})
      end

      def type_symbol
        :float
      end

      def cast_value(value)
        if value.include?('.')
          value.to_f
        else
          value.to_i
        end
      end
    end
  end
end
