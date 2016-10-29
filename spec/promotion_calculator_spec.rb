require 'spec_helper'

describe PromotionCalculator do

  let(:basket) { [1, 1, 3] }
  let(:total)  { 30.00 }
  subject { described_class.new(basket, total) }

  describe "#calculate" do
    context "one promotion" do
      it "calcuates the correct discount for 2 travel card holders" do
        expect(subject.calculate).to eq 1.50
      end

      it "calculates the correct discount for a basket over 60" do
        total = 100.00
        basket = [1, 2, 3]
        expect(described_class.new(basket, total).calculate).to eq 10.00
      end
    end

    context "for multiple promotions together" do
      it "calcuates the correct discount for a basket greater than 60 with 2 travel card holders" do
        total = 100.00
        basket = [1, 1, 2, 3]
        expect(described_class.new(basket, total).calculate).to eq 11.35
      end
    end
  end
end