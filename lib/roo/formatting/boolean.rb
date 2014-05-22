module Roo
  module Formatting
    class Boolean < FormatType
      def type_symbol
        :boolean
      end

      def cast_value(value)
        to_boolean(value).to_s.upcase!
      end

      private

        def to_boolean(value)
          case value
            when 1
              true
            when 'true'
              true
            when 'TRUE'
              true
            when 0
              false
            when 'false'
              false
            when 'FALSE'
              false
            else
              !!value
          end
        end
    end
  end
end
