require 'spec_helper'

describe Tuition do
	describe "amounts" do
		it "must be greater than or equal to 0" do
			t = Tuition.new(year: "2014 - 2015",
			 								amount: -4)

			t.save
			expect(t).to_not be_valid

			t.amount = 500
			t.save
			expect(t).to be_valid
		end
	end
end