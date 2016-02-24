require 'spec_helper'

describe OrderCalculator::Discount do
  context 'progressive discount' do
    subject { described_class.apply(300.0, quantity) }

    context 'when there is only one product' do
      let(:quantity) { 1 }
      it { expect(subject).to be 0.0 }
    end

    context 'when there is two products' do
      let(:quantity) { 2 }
      let(:result) { 30.0 }
      it { expect(subject).to be result}
    end

    context 'when there is three products' do
      let(:quantity) { 3 }
      let(:result) { 45.0 }
      it { expect(subject).to be result }
    end

    context 'when there is three products' do
      let(:quantity) { 4 }
      let(:result) { 60.0 }
      it { expect(subject).to be result}
    end

    context 'when there is more than eigth products' do
      let(:quantity) { 9 }
      let(:result) { 120.0 }
      it { expect(subject).to be result}
    end
  end
end

