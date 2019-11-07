class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    before_action :authenticate_user!, except: [:webhook]

    def webhook
        p "*******************************"
        p current_user
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        user_id = payment.metadata.user_id
        user = User.find(user_id)
        @amount = params[:payment][:data][:object][:display_items][0][:amount].to_i * 100
        @amount += user.balance.amount  
        user.balance.update_attributes(amount: @amount)
    end 

    def new  
    end
    
    def confirm
        amount = params[:amount].to_i * 100 
        session = Stripe::Checkout::Session.create(
            payment_method_types: ["card"], 
            customer_email: current_user.email,
            line_items: [
                {
                    name: "currency",
                    amount: amount, 
                    currency: "aud", 
                    quantity: 1  
                }
            ],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}",
            cancel_url: "#{root_url}unicorns" 
        )

        @session_id = session.id 
        @public_key = Rails.application.credentials.dig(:stripe, :public_key)
        # render "confirm"
    end 

    def success

    end 

  
    
end 