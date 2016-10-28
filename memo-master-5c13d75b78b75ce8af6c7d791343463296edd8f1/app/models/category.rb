class Category < ActiveRecord::Base
	validates_presence_of :name

	has_many :tags
	has_many :announcements, :through => :tags
end
