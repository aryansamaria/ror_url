class AddContentSummaryToLinks < ActiveRecord::Migration[8.0]
  def change
    add_column :links, :content_summary, :text
  end
end
