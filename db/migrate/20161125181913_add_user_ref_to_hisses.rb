class AddUserRefToHisses < ActiveRecord::Migration[5.0]
  def change
    add_reference :hisses, :user, foreign_key: true
  end
end
