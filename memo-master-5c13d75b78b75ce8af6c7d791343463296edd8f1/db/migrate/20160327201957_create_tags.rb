class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :announcement_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
