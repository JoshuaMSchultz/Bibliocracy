class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.text :translation
      t.text :reason
      t.integer :upvotes
      t.integer :donvotes
      t.references :verse
      t.references :chapter
      t.references :book 

      t.timestamps null: false
    end
  end
end
