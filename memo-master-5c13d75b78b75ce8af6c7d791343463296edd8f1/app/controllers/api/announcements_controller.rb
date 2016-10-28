module Api
  class AnnouncementsController < Api::ApplicationController
    def create
      announcement = Announcement.new
      announcement.subject = params[:announcement][:subject]
      announcement.priority = params[:announcement][:priority]
      announcement.needToKnow = params[:announcement][:needToKnow]
      announcement.extra = params[:announcement][:extra]
      announcement.author = params[:announcement][:author]
      announcement.visible = params[:announcement][:visible] || 0

      category_string = params[:announcement][:categories]
      categories = []
      if (category_string.length > 0)
        categories = category_string.split(",").map(&:to_i)
      end

      if params[:announcement][:attach] == ""
      else
        a = Attachment.new
        a.filename = params[:announcement][:attach_name]
        a.content_type = params[:announcement][:attach_type]
        a.file_contents = params[:announcement][:attach]

        a.save
        announcement.attachment_id = a.id
      end

      if announcement.save
        categories.each do |c|
          tag = Tag.new
          tag.announcement_id = announcement.id
          tag.category_id = c
          tag.save
        end
        if announcement.priority == 1
          AnnouncementMailer.send_announcement(announcement).deliver_now
        end
        render json: announcement, status: 201
      else
        render json: announcement.errors, status: 422
      end
    end

    private

    def create_announcement_params
      params.require(:announcement).permit(:subject, :priority, :categories, :needToKnow, :extra, :attach, :attach_type, :attach_name, :author, :visible)
    end

  end
end
