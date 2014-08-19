class Tuition < ActiveRecord::Base
	validates :year, presence: true
	validates :amount, presence: true, numericality: { :greater_than_or_equal_to => 0 }

	belongs_to :user

	def to_s
		if current?
			"#{year} (Current)"
		else
			"#{year}"
		end
	end
end