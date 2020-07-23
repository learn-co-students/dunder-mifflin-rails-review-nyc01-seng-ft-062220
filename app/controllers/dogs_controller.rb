class DogsController < ApplicationController
    before_action :set_dog, only: [:show]

    def index
        @dogs = Dog.all
    end

    def show
    end

    def dogs_employees
        @all_employees = self.employees.all.map { |employee| employee }
    end

    def sorted_dogs
        hash = Hash.new(0)
        Dog.all.each do |dog| 
            dog.each do |dog_inst|
    end

    private 

    def set_dog
        @dog = Dog.find(params[:id])
    end

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end
end

