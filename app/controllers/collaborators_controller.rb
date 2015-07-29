class CollaboratorsController < ApplicationController
	def create
		
		# @wiki = Wiki.find(params[:wiki_id])
		@collaborator = Collaborator.new(params[:collaborator].permit(:wiki_id, :user_id))

		if @collaborator.save
			flash[:notice] = "Collaborator was saved succesfully"
			redirect_to @collaborator.wiki
		else
		end
	end

	def destroy

		@collaborator = Collaborator.find(params[:id])

		if @collaborator.destroy
			flash[:notice] = "\"#{@collaborator.user.email}\" was removed successfully."
			redirect_to @collaborator.wiki
		end
		#make this one
	end
end