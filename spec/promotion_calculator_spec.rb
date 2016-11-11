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

      it "calculates the correct discount for a 3 T-shirts (buy two get one free)" do
        basket = [3,3,3]
        expect(described_class.new(basket, total).calculate).to eq 19.95
      end

      it "calculates the correct discount for multiples of buy 2 get 1 free" do
        basket = [3,3,3,3,3,3]
        expect(described_class.new(basket, total).calculate).to eq (19.95 + 19.95)
      end
    end

    context "for multiple promotions together" do
      it "calcuates the correct discount for a basket greater than 60 with 2 travel card holders" do
        basket = [1, 1, 2, 3]
        total = 100.00
        expect(described_class.new(basket, total).calculate).to eq 11.35
      end

      it "calculates the correct discount for multiple product promos" do
        basket = [1, 1, 4, 4, 4]
        expect(described_class.new(basket, total).calculate).to eq 16.50
      end
    end
  end
end