class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :description
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
