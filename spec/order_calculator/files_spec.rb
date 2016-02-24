require 'spec_helper'

describe OrderCalculator::Files do
  context '.config' do
    subject { described_class.config(options) }

    context 'when it not four arguments' do
      let(:options) { ['asdf'] }
      it do
        expect { subject }.to raise_error ArgumentError,
                                          'É necessário 4 arquivos'
      end
    end

    context 'when it has four arguments' do
      let(:options) { ['asdf', 1, 2, 4] }
      it { expect(subject).to be_a_kind_of(OrderCalculator::Files) }
    end
  end

  context 'coupons file content' do
    subject { described_class.new(options) }
    let(:options) { ['spec/fixture/coupons.csv', 1, 2, 4] }

    let(:result) do
      [
        ["123", "25", "absolute", "2020/12/25", "1"],
        ["234", "15", "percent", "2020/01/01", "2"],
        ["345", "50", "absolute", "2015/12/25", "1"],
        ["456", "25", "percent", "2020/01/31", "2"],
        ["567", "100", "absolute", "2020/12/25", "1"]
      ]
    end

    it { expect(subject.coupons).to match_array result }
  end

  context 'products file content' do
    subject { described_class.new(options) }
    let(:options) { ['', 'spec/fixture/products.csv',  2, 4] }

    let(:result) do
      [["123", "150.0"], ["234", "225.0"], ["345", "250.0"],
       ["456", "175.0"], ["567", "100.0"], ["678", "80.0"],
       ["789", "2400.0"], ["890", "75.0"], ["987", "100.0"], ["876", "120.0"],
       [nil, nil], [nil, nil], [nil, nil], [nil, nil], [nil, nil]]
    end

    it { expect(subject.products).to match_array result }
  end

  context 'orders file content' do
    subject { described_class.new(options) }
    let(:options) { ['', '', 'spec/fixture/orders.csv', ''] }

    let(:result) do
      [["123", nil], ["234", "123"], ["345", "234"], ["456", "345"],
       ["567", "456"], ["678", "567"], ["042", "123"], ["771", nil]]
    end

    it { expect(subject.orders).to match_array result }
  end

  context 'order items file content' do
    subject { described_class.new(options) }
    let(:options) { ['', '', '', 'spec/fixture/order_items.csv'] }

    let(:result) do
      [["123", "789"], ["123", "987"], ["234", "678"], ["234", "890"],
       ["234", "987"], ["345", "345"], ["345", "876"], ["456", "234"],
       ["456", "345"], ["567", "123"], ["567", "234"], ["567", "876"],
       ["567", "890"], ["567", "678"], ["567", "567"], ["678", "789"],
       ["678", "890"], ["771", "789"], ["042", "789"]]
    end

    it { expect(subject.order_items).to match_array result }
  end
end
