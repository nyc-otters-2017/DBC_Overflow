class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.interger :up_or_down, null: false
      t.interger :votable_id, null: false
      t.string :voteable_type, null: false
    end
  end
end
