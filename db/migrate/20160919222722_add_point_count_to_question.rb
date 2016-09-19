class AddPointCountToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :point_count, :integer
  end
end
