require 'date'

module OrderCalculator
  class ManageCoupom

    def initialize(coupons)
      @coupons = coupons
    end

    def find(coupom_id)
      @coupons.find do |c|
        if c.first.eql?(coupom_id) && c[4].to_i > 0 && validity_period?(c[3])
          c[4]= c.last.to_i - 1
          true
        end
      end
    end

    private

    def validity_period?(date)
      Date.parse(date) >= Date.today
    rescue
      fail ArgumentError, 'Data inválida, verifique o arquivo de cupons'
    end
  end
end
