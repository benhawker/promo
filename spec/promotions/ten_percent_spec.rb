require 'spec_helper'

describe TenPercent do

  let(:basket) { [1, 1, 3] }
  let(:total)  { 30.00 }
  subject { described_class.new(basket, total) }

  describe "#calculate" do
    it "calculates the correct discount for a basket over 60" do
      total = 100.00
      basket = [1, 2, 3]
      expect(described_class.new(basket, total).calculate).to eq 10.00
    end

    it "calculates a discount of zero for a basket that is not over 60" do
      subject = described_class.new(basket, 59)
      expect(subject.calculate).to eq 0
    end
  end
end