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
end 

