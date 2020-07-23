class RemoveDogIdFromEmployees < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :dog_id
  end
end
