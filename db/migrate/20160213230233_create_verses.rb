class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.integer :verse_number
      t.references :chapter
      t.references :book

      t.timestamps null: false
    end
  end
end
