class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :up_or_down, null: false
      t.integer :voteable_id, null: false
      t.string :voteable_type, null: false
      t.references :user 

      t.timestamps
    end
  end
end
