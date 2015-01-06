require 'spec_helper'

describe Post do
	describe "titles" do
		it "must be unique" do
			p = Post.new(title: "Post1",
									 content: "This is my post.")
			p.save
			expect(p).to be_valid

			l = Post.new(title: "Post1",
									 content: "This is also my post.")
			l.save
			expect(l).to_not be_valid
		end
	end
end