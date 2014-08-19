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

	describe "years" do
		it "must be unique" do
			t = Tuition.new(year: "2014 - 2015",
			 								amount: 1000)
			t.save
			expect(t).to be_valid

			y = Tuition.new(year: "2014 - 2015",
			 								amount: 3000)
			y.save
			expect(y).to_not be_valid
		end
	end

	describe "current status" do
		it "must be the only tuition that is current" do
			t = Tuition.new(year: "2014 - 2015",
			 								amount: 2000,
			 								current: true)
			t.save
			expect(t).to be_valid

			y = Tuition.new(year: "2015 - 2016",
			 								amount: 6000,
			 								current: true)
			y.save
			expect(y).to_not be_valid

			y.current = false
			y.save
			expect(y).to be_valid
		end
	end
end