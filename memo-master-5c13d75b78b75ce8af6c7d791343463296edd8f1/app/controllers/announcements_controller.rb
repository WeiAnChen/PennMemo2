class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show]
  layout "announcement"

  def show
    @announcement_categories = ""
    if @announcement.categories.empty?
      @announcement_categories = "No categories"
    else
      @announcement.categories.each do |c|
        @announcement_categories = @announcement_categories + ", " + c.name
      end
      @announcement_categories = @announcement_categories[2..-1]
    end
    @attachment = nil
    if @announcement.attachment_id != nil
      @attachment = Attachment.find(@announcement.attachment_id)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def announcement_params
    params[:announcement]
  end
end
