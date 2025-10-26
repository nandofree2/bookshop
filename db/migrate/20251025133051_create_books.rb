class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.string :cover_image
      t.float :rating
      t.decimal :price
      t.integer :flag

      t.timestamps
    end
  end
end
