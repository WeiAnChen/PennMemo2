class Announcement < ActiveRecord::Base
	validates_presence_of :subject
	validates_presence_of :priority
	validates_presence_of :needToKnow
	has_many :tags
	has_many :categories, :through => :tags
  
  ## other fields:
  # field :visible is 0 or 1
  # field :author is text

  scope :visible, -> { where(visible: 1) }
  after_initialize do |announcement|
    announcement.visible = 1
  end
end
