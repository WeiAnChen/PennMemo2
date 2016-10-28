class NursingActivitiesController < ApplicationController
  before_action :set_nursing_activity, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  # GET /nursing_activities
  # GET /nursing_activities.json
  def index
  end

  # GET /nursing_activities/1
  # GET /nursing_activities/1.json
  def show
  end

  # GET /nursing_activities/new
  def new
    @nursing_activity = NursingActivity.new
  end

  # GET /nursing_activities/1/edit
  def edit
  end

  # POST /nursing_activities
  # POST /nursing_activities.json
  def create
    @nursing_activity = NursingActivity.new(nursing_activity_params)

    respond_to do |format|
      if @nursing_activity.save
        format.html { redirect_to @nursing_activity, notice: 'Nursing activity was successfully created.' }
        format.json { render :show, status: :created, location: @nursing_activity }
      else
        format.html { render :new }
        format.json { render json: @nursing_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nursing_activities/1
  # PATCH/PUT /nursing_activities/1.json
  def update
    respond_to do |format|
      if @nursing_activity.update(nursing_activity_params)
        format.html { redirect_to @nursing_activity, notice: 'Nursing activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @nursing_activity }
      else
        format.html { render :edit }
        format.json { render json: @nursing_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def inbox
    @announcements = Announcement.all
    @announcement_categories = {}
    @announcements.visible.each do |a|
      if a.categories.empty?
        @announcement_categories[a.id] = nil
      else
        category_string = ""
        a.categories.each do |c|
          category_string = category_string + ", " + c.name
        end
        @announcement_categories[a.id] = category_string[2..-1]
      end
    end
  end

  # DELETE /nursing_activities/1
  # DELETE /nursing_activities/1.json
  def destroy
    @nursing_activity.destroy
    respond_to do |format|
      format.html { redirect_to nursing_activities_url, notice: 'Nursing activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nursing_activity
      @nursing_activity = NursingActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nursing_activity_params
      params[:nursing_activity]
    end
end
