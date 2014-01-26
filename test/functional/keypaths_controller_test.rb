require 'test_helper'

class KeypathsControllerTest < ActionController::TestCase
  setup do
    @keypath = keypaths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keypaths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keypath" do
    assert_difference('Keypath.count') do
      post :create, :keypath => { :name => @keypath.name }
    end

    assert_redirected_to keypath_path(assigns(:keypath))
  end

  test "should show keypath" do
    get :show, :id => @keypath
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @keypath
    assert_response :success
  end

  test "should update keypath" do
    put :update, :id => @keypath, :keypath => { :name => @keypath.name }
    assert_redirected_to keypath_path(assigns(:keypath))
  end

  test "should destroy keypath" do
    assert_difference('Keypath.count', -1) do
      delete :destroy, :id => @keypath
    end

    assert_redirected_to keypaths_path
  end
end
