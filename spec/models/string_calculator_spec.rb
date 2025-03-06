require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe 'add method' do
    it "returns 0 when blank string passed" do
      sc = StringCalculator.new(string_number: "")
      expect(sc.add).to eq(0)
    end
  end
end
