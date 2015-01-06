require 'spec_helper'

describe Form do
	describe "titles" do
		it "must be unique" do
			f = Form.new(title: "Form1",
									 description: "This is my form.")
			f.save
			expect(f).to be_valid

			g = Form.new(title: "Form1",
									 description: "This is also my form.")
			g.save
			expect(g).to_not be_valid
		end
	end
end