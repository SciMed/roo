require 'spec_helper'

describe Roo::Excelx do
  describe '.new' do
    subject {
      Roo::Excelx.new('test/files/numbers1.xlsx')
    }

    it 'creates an instance' do
      expect(subject).to be_a(Roo::Excelx)
    end

    context 'given a file with missing rels' do
      subject {
        Roo::Excelx.new('test/files/file_item_error.xlsx')
      }

      it 'creates an instance' do
        expect(subject).to be_a(Roo::Excelx)
      end
    end
  end

  describe '#cell' do
    context 'for a link cell' do
      context 'with numeric contents' do
        subject {
          Roo::Excelx.new('test/files/numeric-link.xlsx').cell('A', 1)
        }

        it 'returns a link with the number as a string value' do
          expect(subject).to be_a(Spreadsheet::Link)
          expect(subject).to eq("8675309.0")
        end
      end
    end
    context 'date cell' do
      context 'typed parsing' do
        it 'returns a date for date fields' do
          spreadsheet = Roo::Excelx.new('test/files/xlsx_test.xlsx')
          expected_date = Date.parse('2014-3-1')

          b1 = spreadsheet.cell('B',1)
          expect(b1).to be_a Date
          expect(b1).to eql expected_date

          b2 = spreadsheet.cell('B', 2)
          expect(b2).to be_a Date
          expect(b2).to eql expected_date

          b3 = spreadsheet.cell('B', 3)
          expect(b3).to be_a Date
          expect(b3).to eql expected_date

          b4 = spreadsheet.cell('B', 4)
          expect(b4).to be_a Date
          expect(b4).to eql expected_date

          b5 = spreadsheet.cell('B', 5)
          expect(b5).to be_a Date
          expect(b5).to eql expected_date
        end
      end

      context 'untyped parsing' do
        it 'returns a date string for date fields in YYYY-MM-DD format' do
          spreadsheet = Roo::Excelx.new('test/files/xlsx_test.xlsx', untyped: true)
          expected_date_string = '2014-03-01'

          b1 = spreadsheet.cell('B',1)
          expect(b1).to eql expected_date_string

          b2 = spreadsheet.cell('B', 2)
          expect(b2).to eql expected_date_string

          b3 = spreadsheet.cell('B', 3)
          expect(b3).to eql expected_date_string

          b4 = spreadsheet.cell('B', 4)
          expect(b4).to eql expected_date_string
          b4 = spreadsheet.cell('B', 5)
          expect(b4).to eql expected_date_string
        end
      end
    end
    context 'for a number cell' do
      context 'typed parsing' do
        it 'returns a number for numeric fields' do
          spreadsheet = Roo::Excelx.new('test/files/xlsx_test.xlsx')

          a1 = spreadsheet.cell('A',1)
          expect(a1).to be_an Integer
          expect(a1).to eql 1

          a2 = spreadsheet.cell('A', 2)
          expect(a2).to be_a Float
          expect(a2).to eql 1.0

          a3 = spreadsheet.cell('A', 3)
          expect(a3).to be_a Float
          expect(a3).to eql 1.2

          a4 = spreadsheet.cell('A', 4)
          expect(a4).to be_a Float
          expect(a4).to eql 1.0

          a5 = spreadsheet.cell('A', 5)
          expect(a5).to be_a Float
          expect(a5).to eql 2122.0

          a6 = spreadsheet.cell('A', 6)
          expect(a6).to be_a Float
          expect(a6).to eql -23.00002


          a7 = spreadsheet.cell('A', 7)
          expect(a7).to be_a Integer
          expect(a7).to eql -23

          a8 = spreadsheet.cell('A', 8)
          expect(a8).to be_a Float
          expect(a8).to eql 5.1

          a9 = spreadsheet.cell('A', 9)
          expect(a9).to be_a Float
          expect(a9).to eql 0.3

        end
      end
      context 'untyped parsing' do
        it 'returns a string for numeric fields' do
          spreadsheet = Roo::Excelx.new('test/files/xlsx_test.xlsx', :untyped => true)

          a1 = spreadsheet.cell('A',1)

          expect(a1).to eql '1'

          a2 = spreadsheet.cell('A', 2)
          expect(a2).to eql '1.0'

          a3 = spreadsheet.cell('A', 3)
          expect(a3).to eql '1.2'

          a4 = spreadsheet.cell('A', 4)
          expect(a4).to eql '1.0'

          a5 = spreadsheet.cell('A', 5)
          expect(a5).to eql '2122.0'

          a6 = spreadsheet.cell('A', 6)
          expect(a6).to eql '-23.00002'


          a7 = spreadsheet.cell('A', 7)
          expect(a7).to eql '-23'

          a8 = spreadsheet.cell('A', 8)
          expect(a8).to eql '5.1'

          a9 = spreadsheet.cell('A', 9)
          expect(a9).to eql '0.3'
        end
      end
    end
  end
end
