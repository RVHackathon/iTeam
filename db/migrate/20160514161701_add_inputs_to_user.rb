class AddInputsToUser < ActiveRecord::Migration
  def change
    add_column :users, :github, :string
    add_column :users, :phone_num, :string
  end
end
