class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :book_number


      t.timestamps null: false
    end
  end
end
