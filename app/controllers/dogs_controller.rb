class DogsController < ApplicationController

    def index
        @dogs = Dog.all.sort_by { |dog| dog.employees.count }.reverse
        
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def create
        @dog = Dog.create(dog_params)
        if @dog.valid?
            redirect_to dog_path(@dog)
        else
            flash[:errors] = dog.errors.full_messages
            redirect_to dog_new_path
        end
    end


    private

    def dog_params
    params.require(:dog).permit(:name, :breed, :age)
    end
end
