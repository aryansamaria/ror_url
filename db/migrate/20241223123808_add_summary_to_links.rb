class AddSummaryToLinks < ActiveRecord::Migration[8.0]
  def change
    add_column :links, :summary, :text
  end
end
