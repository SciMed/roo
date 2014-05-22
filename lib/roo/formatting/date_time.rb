module Roo
  module Formatting
    class DateTime < AbstractTimeType
      def type_symbol
        :datetime
      end
      def cast_value(value)
        date = base_date+value.to_f.round(6)
        date.strftime("%Y-%m-%d %H:%M:%S.%N")
      end
    end
  end
end
