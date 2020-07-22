class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :dogs, :employee_id, :integer
  end
end
