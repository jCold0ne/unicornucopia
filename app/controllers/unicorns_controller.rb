class UnicornsController < ApplicationController 

before_action :authenticate_user!, except: [:index, :show]

    def index
        if params[:search] && !params[:search].empty?
            @unicorns = Unicorn.where(name: params[:search])
        else
            @unicorns = Unicorn.all
        end
    end 

    def show
        
    end 

    def collection
        @collection = current_user.unicorns
    end 


      private
    # def unicorn_params
    #     params.require(:milkshake).permit(:name, :description, :price, :pic, ingredient_ids: [])
    # end   
    
    def set_unicorn 
        @unicorn = Unicorn.find(params[:id])
    end 

    def set_user_unicorn
        @unicorn = current_user.unicorns.find_by_id(params[:id])
    

        if @unicorn == nil
        redirect_to unicorns_path
        end 
    end 


end 