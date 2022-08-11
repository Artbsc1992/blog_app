class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :text
      t.integer :commentsCounter, default: 0
      t.integer :likeCounter, default: 0

      t.timestamps
    end
  end
end
