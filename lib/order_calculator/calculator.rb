module OrderCalculator
  class Calculator

    class << self
      def process(data)
        coupons = ManageCoupom.new data.coupons
        data.orders.collect do |o|
          coupom = coupons.find(o.last) unless o.last.nil?

          prices = data
            .order_items.collect { |c| c.last if c.first.eql?(o.first) }.compact
            .collect { |i| data.products.find{|p| p.first.eql?(i)}.last }.compact

          new(o.first, prices, coupom).to_a
        end
      end
    end

    def initialize(order, prices, coupom=[])
      @order = order
      @coupom = coupom
      @prices = prices
    end

    def to_a
      [@order, total.to_s]
    end

    private

    def total
      raw_price - discount
    end

    def discount
       discount = Discount.apply(raw_price, @prices.count)
       return discount if coupom_blank?
       coupom =  Coupom.new(@coupom).apply(raw_price)

       discount > coupom ? discount : coupom
    end

    def raw_price
       @prices.inject(0) { |a, e| a + e.to_f }
    end

    def coupom_blank?
      @coupom.nil? || @coupom.empty?
    end
  end
end
