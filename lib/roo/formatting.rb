require_relative 'formatting/format_type'
require_relative 'formatting/abstract_time_type'
require_relative 'formatting/general'
require_relative 'formatting/date'
require_relative 'formatting/date_time'
require_relative 'formatting/time'
require_relative 'formatting/integer'
require_relative 'formatting/fraction'
require_relative 'formatting/boolean'
require_relative 'formatting/string'
require_relative 'formatting/floating_point'
require_relative 'formatting/percent'
require_relative 'formatting/format_type_factory'
module Roo

  module Formatting
    EXCEPTIONAL_FORMATS = {
      'h:mm am/pm' => :time,
      'h:mm:ss am/pm' => :time,
    }

    STANDARD_FORMATS = {
      0 => 'General',
      1 => '0',
      2 => '0.00',
      3 => '#,##0',
      4 => '#,##0.00',
      9 => '0%',
      10 => '0.00%',
      11 => '0.00E+00',
      12 => '# ?/?',
      13 => '# ??/??',
      14 => 'mm-dd-yy',
      15 => 'd-mmm-yy',
      16 => 'd-mmm',
      17 => 'mmm-yy',
      18 => 'h:mm AM/PM',
      19 => 'h:mm:ss AM/PM',
      20 => 'h:mm',
      21 => 'h:mm:ss',
      22 => 'm/d/yy h:mm',
      37 => '#,##0 ;(#,##0)',
      38 => '#,##0 ;[Red](#,##0)',
      39 => '#,##0.00;(#,##0.00)',
      40 => '#,##0.00;[Red](#,##0.00)',
      45 => 'mm:ss',
      46 => '[h]:mm:ss',
      47 => 'mmss.0',
      48 => '##0.0E+0',
      49 => '@',
    }

    def format_type(format, base_date)
      FormatTypeFactory.from_string(format, base_date)
    end
    module_function :format_type
  end
end
