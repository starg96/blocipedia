class ChargesController < ApplicationController


	def index

	end

	def new
		@stripe_btn_data = {
			key: "#{ Rails.configuration.stripe[:publishable_key] }",
			description: "BigMoney Membership - #{current_user.name}",
			amount: default_amount
		}

	end

	def create
		
		# Creates a Stripe Customer object, for associating
		# with the charge
		customer = Stripe::Customer.create(
			email: current_user.email,
			card: params[:stripeToken]
			)

		# Where the real magic happens
		charge = Stripe::Charge.create(
			customer: customer.id,
			amount: default_amount,
			description: "BigMoney Membership - #{current_user.email}",
			currency: 'usd'
			)

	current_user.update_attributes(role: 'premium')
	current_user.save

	# flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
	redirect_to user_path(current_user)

	rescue Stripe::CardError => e 
		flash[:error] = e.message
		redirect_to new_charge_path
	end

	def default_amount
		amount = 15_00
		amount
	end


end