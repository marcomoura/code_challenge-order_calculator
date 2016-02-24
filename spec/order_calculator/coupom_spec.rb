require 'spec_helper'

describe OrderCalculator::Coupom do
  context '#coupom' do
    subject { described_class.new(coupom).apply(300.0) }

    context 'when is percentage' do
      let(:coupom) { %w(1 50 percent 1234) }

      it { expect(subject).to be 150.0 }
    end

    context 'when is absolute' do
      let(:coupom) { %w(2 50 absolute) }

      it { expect(subject).to be 50 }
    end
  end
end

