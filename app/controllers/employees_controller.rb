class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :update, :edit, :destroy]

    def index
        @employees = Employee.all
    end
        
    def new
        @employee = Employee.new
    end

    def show
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:my_errors] = @employee.errors.full_messages
            redirect_to new_employee_path(@employee)
        end
    end

    def edit
    end

    def update
        @employee.update(employee_params)
        if @employee.save
            redirect_to @employee
        else
            flash[:my_errors] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end

    def set_employee
        @employee = Employee.find(params[:id])
    end
end
