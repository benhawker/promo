require 'spec_helper'

describe Checkout do

  subject { described_class.new }

  describe "#scan" do
    before do
      subject.scan(1)
    end

    it "adds an item to the basket" do
      expect(subject.basket).to eq [1]
    end

    context "when adding a further item" do
      it "adds the second item" do
        subject.scan(2)
        expect(subject.basket).to eq [1, 2]
      end
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

    it "raises an error if the basket is empty" do
      subject.basket.clear
      expect { subject.total } .to raise_error EmptyBasket
    end

    context "baskets that qualifies for no promotion" do
      it "returns the correct total" do
        expect { subject.total }.to output("Total: £54.25 \n").to_stdout
      end
    end

    context "baskets that qualify for a single promotion" do
      it "returns the correct total" do
        subject.scan(003)
        expect(STDOUT).to receive(:puts).with "New Total: £66.78"
        subject.total
      end

      it "returns the correct total" do
        subject.basket.clear
        subject.scan(001); subject.scan(001); subject.scan(003);
        expect(STDOUT).to receive(:puts).with "New Total: £36.95"
        subject.total
      end
    end

    context "baskets that qualify for multiple promotions" do
      it "returns the correct total for 1, 1, 2, 3" do
        subject.scan(001); subject.scan(003)
        expect(STDOUT).to receive(:puts).with "New Total: £73.76"
        subject.total
      end
    end
  end
end