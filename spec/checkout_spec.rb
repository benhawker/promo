require 'spec_helper'

describe Checkout do

  subject { described_class.new }

  describe "#scan" do
    before do
      subject.scan(001)
    end

    it "adds an item to the basket" do
      expect(subject.basket).to eq [1]
    end

    context "when user provides an invalid product" do
      it "raises an error with a prompt for the user" do
        expect { subject.scan(111) }.to raise_error InvalidProductGiven
      end
    end
  end

  describe "#total" do
    before do
      subject.scan(001)
      subject.scan(002)
    end

    it "returns the correct total" do
      expect(subject.total).to eq "£54.25"
    end
  end
end