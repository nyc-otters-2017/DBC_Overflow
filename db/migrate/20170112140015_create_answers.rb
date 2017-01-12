class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body_answer, null: false
      t.integer :total_votes, null: false

      t.references :user, :question
      t.timestamps
    end
  end
end
