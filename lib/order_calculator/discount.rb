module OrderCalculator
  class Discount
    def self.apply(value, quantity)
      new(value, quantity).apply
    end

    def initialize(value, quantity)
      @quantity = quantity
      @value = value
    end

    def apply
      return 0.0 if @quantity.eql? 1
      @value * discount
    end

    private

    def discount
      case @quantity
      when 2 then 0.10
      when 3 then 0.15
      when 4 then 0.20
      when 5 then 0.25
      when 6 then 0.30
      when 7 then 0.35
      else 0.40
      end
    end
  end
end
