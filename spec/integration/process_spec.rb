require 'spec_helper'

describe 'integration spec' do
  let(:inputs) { OrderCalculator::Files.config(files) }

  subject { OrderCalculator::Calculator.process(inputs) }

  let(:files) do
    %w(spec/fixture/coupons.csv spec/fixture/products.csv
       spec/fixture/orders.csv spec/fixture/order_items.csv)
  end

  let(:result) { CSV.read('spec/fixture/output.csv') }

  it { expect(subject).to match_array result }
end
