class DogsController < ApplicationController
    before_action :find_dog, except: [:index, :new, :create]

    def index
        @dogs = Dog.all
    end

    def show
        @dog
    end

    def new
        @dog = Dog.new
    end

    def edit
        @dog
    end

    def create
        @dog = Dog.new(dog_params)
        if @dog.valid?
            @dog.save
            redirect_to dog_path(@dog)
        else
            #! test this new syntax
            redirect_to new_dog_path, form_error: @dog.errors.full_messages
        end
    end

    def update
        if @dog.update(dog_params)
            redirect_to dog_path(@dog)
        else
            redirect_to edit_dog_path, form_error: @dog.errors.full_messages
        end
    end

    # button not implemented in view page; not required as per deliverables 
    def destroy
        @dog.destroy

        redirect_to dogs_path
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end

    def find_dog
        @dog = Dog.find(params[:id])
    end


end
