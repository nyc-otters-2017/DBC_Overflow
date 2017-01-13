class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body_comment, null: false
      t.integer :commentable_id , null: false
      t.string :commentable_type, null: false
      t.references :user 

      t.timestamps
    end
  end
end
