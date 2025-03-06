require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe 'add method' do
    it "returns 0 when blank string passed" do
      sc = StringCalculator.new(string_number: "")
      expect(sc.add).to eq(0)
    end

    it "returns sum when single string number passed" do
      sc = StringCalculator.new(string_number: "1")
      expect(sc.add).to eq(1)
    end

    it "returns sum when multiple string numbers passed" do
      sc = StringCalculator.new(string_number: "1,2\n3")
      expect(sc.add).to eq(6)
    end

    it "returns sum when multiple string numbers with new delimitter passed" do
      sc = StringCalculator.new(string_number: "//;\n1;2\n3,4")
      expect(sc.add).to eq(10)
    end

    it "returns error message when string numbers contains negative number" do
      sc = StringCalculator.new(string_number: "//;\n1;-2\n3,-4,5")
      expect { sc.add }.to raise_error(RuntimeError, "negative numbers not allowed -2, -4")
    end
  end
end
