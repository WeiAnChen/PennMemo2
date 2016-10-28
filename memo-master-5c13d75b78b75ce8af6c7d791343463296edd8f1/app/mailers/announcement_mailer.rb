class AnnouncementMailer < ApplicationMailer
	def send_announcement(announcement)
		@an = announcement
		mail(:to => "davehand13@gmail.com", :subject => @an.subject) do |format|
			format.html
			format.text
		end
	end
end
