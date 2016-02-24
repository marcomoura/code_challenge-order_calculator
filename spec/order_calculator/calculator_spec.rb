require 'spec_helper'

describe OrderCalculator::Calculator do
  subject { described_class.new order, prices, coupom }

  context 'final value of the order' do
    subject { described_class.process(options) }

    let(:options) do
      double orders: [['1', '171']],
             coupons: [['171', '50', 'percent', '2020/01/01', '1']],
             order_items: [["1", "222"]],
             products: [["222", "500.0"]]
    end

    let(:result) { [['1', '250.0']] }

    it { expect(subject).to match_array result }
  end

  context '#to_a' do
    context 'when is only one product' do
      let(:order) { '1' }
      let(:prices) { ['100.0'] }
      let(:coupom) { ['1', '50', 'percent'] }
      let(:result) { ['1', '50.0'] }

      it { expect(subject.to_a).to match_array result }
    end
    context 'when is two products' do
      let(:order) { '1' }
      let(:prices) { ['100.0', '100.0'] }
      let(:coupom) { [] }
      let(:result) { ['1', '180.0'] }

      it { expect(subject.to_a).to match_array result }
    end
  end
end
