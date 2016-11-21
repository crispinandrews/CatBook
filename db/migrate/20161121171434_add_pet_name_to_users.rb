class AddPetNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :petname, :string
  end
end
