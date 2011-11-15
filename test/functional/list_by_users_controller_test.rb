require 'test_helper'

class ListByUsersControllerTest < ActionController::TestCase
  setup do
    @list_by_user = list_by_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_by_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_by_user" do
    assert_difference('ListByUser.count') do
      post :create, list_by_user: @list_by_user.attributes
    end

    assert_redirected_to list_by_user_path(assigns(:list_by_user))
  end

  test "should show list_by_user" do
    get :show, id: @list_by_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_by_user.to_param
    assert_response :success
  end

  test "should update list_by_user" do
    put :update, id: @list_by_user.to_param, list_by_user: @list_by_user.attributes
    assert_redirected_to list_by_user_path(assigns(:list_by_user))
  end

  test "should destroy list_by_user" do
    assert_difference('ListByUser.count', -1) do
      delete :destroy, id: @list_by_user.to_param
    end

    assert_redirected_to list_by_users_path
  end
end
