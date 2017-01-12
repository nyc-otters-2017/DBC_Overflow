class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :body_question, null: false
      t.intger :total_votes, null: false

      t.timestamps(null: false)
    end
  end
end
