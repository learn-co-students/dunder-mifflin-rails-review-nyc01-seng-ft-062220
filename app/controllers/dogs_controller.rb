class DogsController < ApplicationController

    def index
    @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def create
        if @dog = Dog.create(dog_params)
            redirect_to dog_path(@dog)
        else
            flash[:error] = dog.errors.full_messages
            redirect_to dog_new_path
        end
    end


    private

    def dog_params
    params.require(:dog).permit(:name, :breed, :age)
    end
end
