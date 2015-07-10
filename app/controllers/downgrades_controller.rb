class DowngradesController < ApplicationController
	def create
		# params == {id: 1}
		@user = User.find(params[:id])
		@wikis = @user.wikis.visible_to(@user)
		@user.update_attribute(:role, "standard")
		@wikis.update_all(private: false)

		redirect_to @user
	end
end