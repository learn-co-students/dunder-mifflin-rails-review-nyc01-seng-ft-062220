class DogsController < ApplicationController
    before_action :dog_find, only: [:show, :edit, :update, :destroy]

    def index
        @dogs = Dog.all.sort_by {|dog| dog.employees.count}
    end

    def show
        #dog_find
    end

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new(dog_params)
        if @dog.save
            redirect_to dog_path(@dog)
        else
            flash[:my_errors] = @dog.errors.full_messages
            render :new
        end
    end

    def edit
        #dog_find
    end

    def update
        #dog_find
        if @dog.update(dog_params)
            redirect_to dog_path(@dog)
        else
            flash[:my_errors] = @dog.errors.full_messages
            render :edit
        end
    end

    def destroy
        #dog_find
        @dog.destroy
        redirect_to dogs_path
    end


    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end

    def dog_find
        @dog = Dog.find(params[:id])
    end
    

end
