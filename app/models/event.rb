class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_in_the_past, :end_date_must_come_after_the_start_date

	belongs_to :user

	def self.upcoming_events
		date_range = Date.today..Date.today + 90.day
		Event.where(:start_date => date_range).limit(5)
	end

	def start_date_cannot_be_in_the_past
		if start_date.present? && start_date < Date.today
			errors.add(:start_date, "can't be in the past")
		end
	end

	def end_date_cannot_be_in_the_past
		if end_date.present? && end_date < Date.today
			errors.add(:end_date, "can't be in the past")
		end
	end

	def end_date_must_come_after_the_start_date
		if start_date.present? && end_date.present? && end_date < start_date
			errors.add(:end_date, "must come after the Start Date")
		end
	end

	def formatted_start_date
		start_date.strftime("%b %d")
	end

	def formatted_end_date
		end_date.strftime("%b %d")
	end
end