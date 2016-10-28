class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :subject
      t.integer :priority
      t.string :purpose
      t.string :needToKnow
      t.string :extra

      t.timestamps null: false
    end
  end
end
