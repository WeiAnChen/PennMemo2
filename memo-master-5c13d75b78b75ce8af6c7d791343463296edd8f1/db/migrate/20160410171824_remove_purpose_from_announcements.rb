class RemovePurposeFromAnnouncements < ActiveRecord::Migration
  def change
    remove_column :announcements, :purpose, :string
  end
end
