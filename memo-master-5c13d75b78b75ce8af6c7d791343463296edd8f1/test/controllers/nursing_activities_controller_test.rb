require 'test_helper'

class NursingActivitiesControllerTest < ActionController::TestCase
  setup do
    @nursing_activity = nursing_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nursing_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nursing_activity" do
    assert_difference('NursingActivity.count') do
      post :create, nursing_activity: {  }
    end

    assert_redirected_to nursing_activity_path(assigns(:nursing_activity))
  end

  test "should show nursing_activity" do
    get :show, id: @nursing_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nursing_activity
    assert_response :success
  end

  test "should update nursing_activity" do
    patch :update, id: @nursing_activity, nursing_activity: {  }
    assert_redirected_to nursing_activity_path(assigns(:nursing_activity))
  end

  test "should destroy nursing_activity" do
    assert_difference('NursingActivity.count', -1) do
      delete :destroy, id: @nursing_activity
    end

    assert_redirected_to nursing_activities_path
  end
end
