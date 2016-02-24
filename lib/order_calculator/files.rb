require 'csv'

module OrderCalculator
  class Files
    class << self
      def config(files)
        fail ArgumentError, 'É necessário 4 arquivos' unless files.size.eql?(4)
        new files
      end

      def generate(output)
        CSV.open('output.csv', 'wb') { |csv| output.map { |o| csv << o } }
      end
    end

    def initialize(files)
      @files = files
    end

    def coupons
      @_c ||= read_file @files[0]
    end

    def products
      @_p ||= read_file @files[1]
    end

    def orders
      @_orders ||= read_file(@files[2])
    end

    def order_items
      @_items ||= read_file(@files[3])
    end

    private

    def read_file(file_name)
      ::CSV.read file_name
    end
  end
end
