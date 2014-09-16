class Tuition < ActiveRecord::Base
	validates :year, presence: true, uniqueness: true
	validates :amount, presence: true, numericality: { :greater_than_or_equal_to => 0 }
	validates :current, uniqueness: true

	belongs_to :user

	def to_s
		if current?
			"#{year} (Current)"
		else
			"#{year}"
		end
	end

	def self.is_current
		Tuition.where(current: true).first
	end
end