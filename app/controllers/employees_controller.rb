class EmployeesController < ApplicationController
    helper EmployeesHelper

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            flash[:user_error] = @employee.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    def new
        @employee = Employee.new
    end
    
    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:user_error] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
        
end
