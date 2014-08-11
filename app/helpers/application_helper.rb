module ApplicationHelper
	def faculty_only(&block)
		block.call if current_user.try(:faculty?)
	end

	def admins_only(&block)
		block.call if current_user.try(:admin?)
	end
end
