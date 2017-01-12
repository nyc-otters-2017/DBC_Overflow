class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :up_or_down, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
    end
  end
end
