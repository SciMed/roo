module Roo
  module Formatting
    class AbstractTimeType < FormatType
      attr_reader :base_date
      def initialize(options = {})
        @base_date = options.fetch(:base_date) { ::Date.new(1899, 12, 30) }
      end
    end
  end
end
