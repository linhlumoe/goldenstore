class ChargesController < ApplicationController
  before_action :set_total, only: [:create, :new]
  before_action :user_login?, only: [:create, :new]

  def new
  end

  def create
    # Amount in cents
    @amount = (@amount * 100).to_i
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    current_order.update!(order_status: 'Placed', user: current_user)
    session.delete(:order_id)
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

    def set_total
      @amount = current_order.total
    end

    def user_login?
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end

end