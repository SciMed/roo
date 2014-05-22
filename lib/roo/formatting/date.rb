module Roo
  module Formatting
    class Date < AbstractTimeType
      def type_symbol
        :date
      end

      def cast_value(value)
        date = base_date + value.to_i
        date.strftime("%Y-%m-%d")
      end
    end
  end
end
