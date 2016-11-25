class ChangeColumnName < ActiveRecord::Migration[5.0]
 def change
   rename_column :relationships, :friend_id, :relation_id
  end
end
