class FixColumnNames < ActiveRecord::Migration[7.0]
  def change
     rename_column :users, :name, :firstName
     rename_column :users, :brand, :lastName
     rename_column :users, :price, :email
     rename_column :users, :description, :birthday
     end
end
