class EmployeesController < ApplicationController
    before_action :employee_find, only: [:show, :edit, :update, :destroy]
    def index
        @employees = Employee.all
    end

    def show
        #before action 
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:my_errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end


    def edit
        #before action
        @dogs = Dog.all
    end


    def update
        #before action
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            flash[:my_errors] = @employee.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    def destroy
        #before action
        @employee.destroy
        redirect_to employees_path
    end


    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :title, :alias, :office, :img_url, :dog_id)
    end

    def employee_find
        @employee = Employee.all.find(params[:id])
    end
end
