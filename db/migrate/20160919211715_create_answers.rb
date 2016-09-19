class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.column :title, :string
      t.column :text, :string

      t.timestamps
    end
  end
end
