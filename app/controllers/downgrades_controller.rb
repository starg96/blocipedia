class DowngradesController < ApplicationController
	def create
		# params == {id: 1}
		@user = User.find(params[:id])
		@user.update_attribute(:role, "standard")
		redirect_to @user
	end
end