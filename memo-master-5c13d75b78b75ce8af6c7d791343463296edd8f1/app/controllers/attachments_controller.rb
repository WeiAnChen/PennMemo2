class AttachmentsController < ApplicationController
	before_action :set_attachment, only: [:show]
	before_filter :authorize
	layout "attachment"

	def show
    send_data(@attachment.file_contents, type: @attachment.content_type, filename: @attachment.filename)
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params[:attachment]
    end
end
