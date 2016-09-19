class AddQuestionIndexToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :question_index, :integer
  end
end
