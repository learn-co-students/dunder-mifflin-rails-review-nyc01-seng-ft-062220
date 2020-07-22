class EmployeesController < ApplicationController
    before_action :find_employee, except: [:index, :new, :create]


    def index
        @employees = Employee.all
    end

    def show
        @employee
    end

    def new
        @employee = Employee.new
    end

    def edit
        @employee
    end

    def create
        @employee = Employee.new(employee_params)

        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            redirect_to new_employee_path(@employee), form_error: @employee.errors.full_messages
        end
    end

    def update

        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            redirect_to edit_employee_path(@employee), form_error: @employee.errors.full_messages
        end
    end

    # button not implemented in view page; not required as per deliverables 
    def destroy
        @employee.destroy

        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog, :img_url)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
    
end
