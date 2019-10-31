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


end 