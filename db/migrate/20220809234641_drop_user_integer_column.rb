class DropUserIntegerColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :integer
  end
end
