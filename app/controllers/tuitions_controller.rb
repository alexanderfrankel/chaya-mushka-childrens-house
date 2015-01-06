class TuitionsController < ApplicationController
	def index
		@tuition = Tuition.is_current
	end
end