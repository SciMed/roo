require 'spec_helper'

describe Roo::Formatting do
  describe '#to_type_symbol' do
    FORMATS = {
      'General' => :float,
      '0' => :integer,
      '0.00' => :float,
      '#,##0' => :integer,
      '#,##0.00' => :float,
      '0%' => :percentage,
      '0.00%' => :percentage,
      '0.00E+00' => :float,
      '# ?/?' => :fraction, #??? TODO:
      '# ??/??' => :fraction, #??? TODO:
      'mm-dd-yy' => :date,
      'd-mmm-yy' => :date,
      'd-mmm' => :date,
      'mmm-yy' => :date,
      'h:mm AM/PM' => :time,
      'h:mm:ss AM/PM' => :time,
      'h:mm' => :time,
      'h:mm:ss' => :time,
      'm/d/yy h:mm' => :datetime,
      '#,##0 ;(#,##0)' => :integer,
      '#,##0 ;[Red](#,##0)' => :integer,
      '#,##0.00;(#,##0.00)' => :float,
      '#,##0.00;[Red](#,##0.00)' => :float,
      '#,##0_);[Red](#,##0)' => :integer,
      'mm:ss' => :time,
      '[h]:mm:ss' => :time,
      'mmss.0' => :time,
      '##0.0E+0' => :float,
      '@' => :float,
      #-- zusaetzliche Formate, die nicht standardmaessig definiert sind:
      "yyyy\\-mm\\-dd" => :date,
      'dd/mm/yy' => :date,
      'hh:mm:ss' => :time,
      "dd/mm/yy\\ hh:mm" => :datetime,
      'dd/mmm/yy\\ hh:mm' => :datetime,
      'dd/mmm/yy' => :date, # 2011-05-21
      'yyyy-mm-dd' => :date, # 2011-09-16
      'yyyy-mm-dd;@' => :date,
      '#0_);[Red]\(0\)' => :integer
    }.each do |format, type|
      it "translates #{format} to #{type}" do
        expect(Roo::Formatting.format_type(format, Date.parse('1900-01-01')).type_symbol).to eql type
      end
    end
  end
end
