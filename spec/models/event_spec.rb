require 'spec_helper'

describe Event do
	describe "start dates" do
		it "cannot be in the past" do
			e = Event.new(title: "new event",
										description: "this is my new event",
										start_date: "2014-01-03 00:00:00",
										end_date: "2015-09-03 00:00:00")

			e.save
			expect(e).to_not be_valid

			e.start_date = "2015-02-03 00:00:00"
			e.save
			expect(e).to be_valid
		end
	end

	describe "end dates" do
		it "cannot be in the past" do
			e = Event.new(title: "new event",
										description: "this is my new event",
										start_date: "2015-01-03 00:00:00",
										end_date: "2014-02-03 00:00:00")

			e.save
			expect(e).to_not be_valid

			e.end_date = "2015-02-03 00:00:00"
			e.save
			expect(e).to be_valid
		end

		it "must come after start dates" do
			e = Event.new(title: "new event",
										description: "this is my new event",
										start_date: "2016-02-03 00:00:00",
										end_date: "2016-01-03 00:00:00")

			e.save
			expect(e).to_not be_valid

			e.end_date = "2016-03-03 00:00:00"
			e.save
			expect(e).to be_valid
		end
	end
end