class AddAttachmentToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :attachment_id, :integer
  end
end
