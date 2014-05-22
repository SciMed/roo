module Roo
  module Formatting
    class FormatGuesser
      def guess_format(format_string)
        type_class = type_map[format_string]

        type_class = guess_non_standard_format(format_string) unless type_class

        type_class
      end

      private

      def guess_non_standard_format(format_string)
        case
          when date_format?(format_string)
            date_time_format(format_string)
          when time_format?(format_string)
            Roo::Formatting::Time
          else
            Roo::Formatting::General
        end
      end

      def date_time_format(format_string)
        if time_format?(format_string)
          Roo::Formatting::DateTime
        else
          Roo::Formatting::Date
        end
      end

      def time_format?(format_string)
        format_string.include?('h') || format_string.include?('s')
      end

      def date_format?(format_string)
        format_string.include?('y') || format_includes_days?(format_string)
      end

      def format_includes_days?(format_string)
        !format_string.match(/d+(?![\]])/).nil?
      end

      def type_map
        {
          'General' => Roo::Formatting::General,

          '@' => Roo::Formatting::FloatingPoint,

          'mm-dd-yy' => Roo::Formatting::Date,
          'd-mmm-yy' => Roo::Formatting::Date,
          'd-mmm' => Roo::Formatting::Date,
          'mmm-yy' => Roo::Formatting::Date,
          'yyyy\\-mm\\-dd' => Roo::Formatting::Date,
          'dd/mm/yy' => Roo::Formatting::Date,
          'dd/mmm/yy' => Roo::Formatting::Date,
          'yyyy-mm-dd' => Roo::Formatting::Date,
          'yyyy-mm-dd;@' => Roo::Formatting::Date,

          'm/d/yy h:mm' => Roo::Formatting::DateTime,
          'dd/mm/yy\\ hh:mm' => Roo::Formatting::DateTime,
          'dd/mmm/yy\\ hh:mm' => Roo::Formatting::DateTime,

          'h:mm AM/PM' => Roo::Formatting::Time,
          'h:mm:ss AM/PM' => Roo::Formatting::Time,
          'h:mm' => Roo::Formatting::Time,
          'h:mm:ss' => Roo::Formatting::Time,
          'hh:mm:ss' => Roo::Formatting::Time,
          'h:mm am/pm' => Roo::Formatting::Time,
          'h:mm:ss am/pm' => Roo::Formatting::Time,
          '[h]:mm:ss' => Roo::Formatting::Time,
          'mmss.0' => Roo::Formatting::Time,
          'mm:ss' => Roo::Formatting::Time,
        }
      end
    end
  end
end
