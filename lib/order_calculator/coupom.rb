module OrderCalculator
  class Coupom
    def initialize(coupom)
      @coupom = coupom
    end

    def apply(value)
      percent? ? calc_percent(value) : calc_abs(value)
    end

    private

    def calc_percent(value)
      value * discount / 100.0
    end

    def calc_abs(value)
      discount
    end

    def discount
      @coupom[1].to_i
    end

    def percent?
      @coupom[2].eql? 'percent'
    end
  end
end
