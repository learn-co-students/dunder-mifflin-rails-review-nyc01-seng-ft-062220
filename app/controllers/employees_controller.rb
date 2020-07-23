class EmployeesController < ApplicationController
    before_action :find_employee, only: [:edit, :update, :destroy, :show]

    def index
        @employees = Employee.all
    end

    def show
    end

    def edit
        @dogs = Dog.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.create(empl_params)

        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            flash[:my_errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def update
        if @employee.update(empl_params)
            redirect_to employee_path(@employee)
        else
            flash[:my_errors] = @employee.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    private

    def find_employee
        @employee = Employee.find(params[:id])
    end

    def empl_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id )
    end
end
