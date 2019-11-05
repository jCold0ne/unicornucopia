class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        p "#########################"

        if current_user.balance == nil 
            current_user.create_balance(amount: 100000)
        end 
       unicorns_path 
    end 

end
