class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :dogs, :employee_id
  end
end
