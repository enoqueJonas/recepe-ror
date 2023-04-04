class FoodsController < ApplicationController 
    def index
        @foods = current_user.foods
    end

    def show

    end

    def new

    end

    def create

    end
end