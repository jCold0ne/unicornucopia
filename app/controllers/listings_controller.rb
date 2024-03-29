class ListingsController < ApplicationController 

    def new 
        unicorn_id = UnicornsUser.where(user_id: current_user.id).where(unicorn_id: params[:unicorn_id])
        UnicornsListing.create(unicorns_user_id: unicorn_id[0].id ,buyout_price: params[:buyout_price])
        # byebug
        redirect_to unicorns_path 
    end 

    def index 
        @listings = UnicornsListing.all
    end 

    def purchase
        @listing = UnicornsListing.find(params[:id])

        if current_user.balances.sum(:amount) < @listing.buyout_price
            flash[:notice] = "Insufficient Funds"
            redirect_to new_payment_path 
            return 
        end   
        
        buyer_balance = Balance.create(user_id: current_user.id,amount: @listing.buyout_price * -1)
        seller_balance = Balance.create(user_id: @listing.user.id,amount: @listing.buyout_price)
        purchase = Purchase.create(unicorns_listing_id:@listing.id, buyer_balance_id: buyer_balance.id, seller_balance_id: seller_balance.id)
        
        if purchase 
            current_user.unicorns.push(@listing.unicorn)
            @listing.unicorns_user.destroy
            redirect_to collection_path
        else 
            redirect_to unicorns_path
        end 

     
    end 

    def show 
        @listings = UnicornsListing.find(params[:id])
    end 

end 

