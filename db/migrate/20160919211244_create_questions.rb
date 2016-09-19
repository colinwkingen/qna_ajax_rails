class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.column :title, :string
      t.column :text, :string

      t.timestamps
    end
  end
end
