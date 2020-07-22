class DogsController < ApplicationController
    helper EmployeesHelper
    
    def index
        @dogs = Dog.all.sort_by {|obj| obj.employees.count}.reverse
    end
    
    def show
        @dog = Dog.find(params[:id])
    end

end
