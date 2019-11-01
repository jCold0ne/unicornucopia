class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
    end 

    def webhook
        p "*******************************"
        p params
    end 

    def new
        
    end
    
    def confirm
        session = Stripe::Checkout::Session.create(
            payment_method_types: ["card"], 
            customer_email: current_user.email,
            line_items: [
                {
                    name: "currency",
                    amount: params[:amount], 
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

  

end 