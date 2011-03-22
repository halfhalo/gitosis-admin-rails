require 'test_helper'

class GitsControllerTest < ActionController::TestCase
  setup do
    @git = gits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create git" do
    assert_difference('Git.count') do
      post :create, :git => @git.attributes
    end

    assert_redirected_to git_path(assigns(:git))
  end

  test "should show git" do
    get :show, :id => @git.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @git.to_param
    assert_response :success
  end

  test "should update git" do
    put :update, :id => @git.to_param, :git => @git.attributes
    assert_redirected_to git_path(assigns(:git))
  end

  test "should destroy git" do
    assert_difference('Git.count', -1) do
      delete :destroy, :id => @git.to_param
    end

    assert_redirected_to gits_path
  end
end
