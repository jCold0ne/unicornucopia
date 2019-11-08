class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        p "#########################"

        if current_user.balances.count == 0 
            current_user.balances.create(amount: 100000)
        end 
       unicorns_path 
    end 

end
