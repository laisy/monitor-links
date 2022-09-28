class CreateScreenshots < ActiveRecord::Migration[6.1]
  def change
    create_table :screenshots do |t|
      t.string :title
      t.text :image_data
      t.references :link, null: true, foreign_key: true

      t.timestamps
    end
  end
end
