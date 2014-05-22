module Roo
  module Formatting
    class Time < AbstractTimeType
      def type_symbol
        :time
      end
      def cast_value(value)
        date = base_date+value.to_f
        date.strftime("%H:%M:%S")
      end
    end
  end
end
