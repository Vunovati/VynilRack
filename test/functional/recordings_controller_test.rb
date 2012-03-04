require 'test_helper'

class RecordingsControllerTest < ActionController::TestCase
  setup do
    @recording = recordings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recordings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recording" do
    assert_difference('Recording.count') do
      post :create, recording: @recording.attributes
    end

    assert_redirected_to recording_path(assigns(:recording))
  end

  test "should show recording" do
    get :show, id: @recording
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recording
    assert_response :success
  end

  test "should update recording" do
    put :update, id: @recording, recording: @recording.attributes
    assert_redirected_to recording_path(assigns(:recording))
  end

  test "should destroy recording" do
    assert_difference('Recording.count', -1) do
      delete :destroy, id: @recording
    end

    assert_redirected_to recordings_path
  end
end
