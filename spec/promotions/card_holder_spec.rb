require 'spec_helper'

describe CardHolder do

  let(:basket) { [1, 1, 3] }
  let(:total)  { 30.00 }
  subject { described_class.new(basket, total) }

  describe "#calculate" do
    context "one promotion" do
      it "calcuates the correct discount for 2 travel card holders" do
        expect(subject.calculate).to eq 1.50
      end

      it "calculates a discount of zero with only 1 travel card holder" do
        subject = described_class.new([1,2,3,3,3], 100)
        expect(subject.calculate).to eq 0
      end
    end
  end
end