class Post < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :content, presence: true

	belongs_to :user

	def formatted_created_at
		created_at.strftime("%b %d")
	end
end