class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :Home

      t.timestamps null: false
    end
  end
end
