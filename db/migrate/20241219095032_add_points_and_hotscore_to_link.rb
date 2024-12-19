class AddPointsAndHotscoreToLink < ActiveRecord::Migration[8.0]
  def change
    add_column :links, :points, :integer, default: 1
    add_column :links, :hot_score, :float, default: 0
  end
end
