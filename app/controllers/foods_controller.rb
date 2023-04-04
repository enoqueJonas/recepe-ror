class FoodsController < ApplicationController 
    def index
        @foods = current_user.foods
    end

    def show

    end

    def new
        @food = Food.new
    end

    def create
        @food = Food.new params_provider
        @food.user = current_user

        if @food.save
            flash[:notice] = 'Food created succesfully'
            redirect_to foods_path
        else
            flash[:alert] = 'Error'
            render :new
        end
    end

    def params_provider
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
end