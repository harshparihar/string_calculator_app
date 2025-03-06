require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe 'add method' do
    it "returns 0 when blank string passed" do
      expect(StringCalculator.new.add("")).to eq(0)
    end

    it "returns sum when single string number passed" do
      expect(StringCalculator.new.add("1")).to eq(1)
    end

    it "returns sum when multiple string numbers passed" do
      expect(StringCalculator.new.add("1,2\n3")).to eq(6)
    end

    it "returns sum when multiple string numbers with new delimitter passed" do
      expect(StringCalculator.new.add("//;\n1;2\n3,4")).to eq(10)
    end

    it "returns error message when string numbers contains negative number" do
      expect { StringCalculator.new.add("//;\n1;-2\n3,-4,5") }.to raise_error(RuntimeError, "negative numbers not allowed -2, -4")
    end
  end
end
