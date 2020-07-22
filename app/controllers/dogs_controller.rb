class DogsController < ApplicationController

    def index
        @dogs = Dog.all.sort_by{|dog| dog.employees.count}
    end

    def new
        @dog = Dog.new
    end

    def show
        find_dog
    end

    def create
        @dog = Dog.create(dog_params)

        redirect_to dog_path(@dog)
    end

    def edit
        find_dog
    end

    def update
        find_dog.update(dog_params)

        redirect_to dog_path(@dog)
    end

    def destroy
        find_dog.destroy

        redirect_to dogs_path
    end


    private

    def find_dog
        @dog = Dog.find(params[:id])
    end


    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end


end
