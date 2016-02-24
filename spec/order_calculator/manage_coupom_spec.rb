require 'spec_helper'

describe OrderCalculator::ManageCoupom do
  subject { described_class.new coupons }

  let(:coupons) do
    [
      ["1", "15", "absolute", "2020/12/25", "1"],
      ["2", "25", "percent", "2020/01/01", "2"]
    ]
  end

  let(:result) { ["1", "15", "absolute", "2020/12/25", 0] }

  it { expect(subject.find('1')).to match_array result }
end
