class WelcomePolicy < ApplicationPolicy
	def index?
		if user.role == 'standard'
			true
		else
			false
		end
	end
end