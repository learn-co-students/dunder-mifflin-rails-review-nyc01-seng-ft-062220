class ChangeDogAddColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :dogs, :age, :integer
  end
end
