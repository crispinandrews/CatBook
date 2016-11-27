class CreateCommentHisses < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_hisses do |t|
      t.belongs_to :comment, foreign_key: true

      t.timestamps
    end
  end
end
