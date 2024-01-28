class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :link, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
