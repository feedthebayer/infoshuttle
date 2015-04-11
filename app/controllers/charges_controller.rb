class ChargesController < ApplicationController

  def new
    if current_user
      @can_upgrade_current_user = !current_user.premium?
    end

    if @can_upgrade_current_user
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "InfoShuttle Premium",
        amount: Premium.cost
      }
    end
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken],
      description: current_user.username
    )

    charge = Stripe::Charge.create(
      customer: customer.id, # Note - NOT user_id
      amount: Premium.cost,
      description: "InfoShuttle Premium Membership",
      currency: "usd"
    )

    current_user.update!(premium: true)
    flash[:success] = "Thank you! You are now a premium user!"
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to premium_path
  end
end
