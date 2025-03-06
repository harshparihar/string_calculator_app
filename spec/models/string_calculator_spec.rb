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
  end
end
