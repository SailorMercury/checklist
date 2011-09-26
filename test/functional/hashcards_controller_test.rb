require 'test_helper'

class HashcardsControllerTest < ActionController::TestCase
  setup do
    @hashcard = hashcards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hashcards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hashcard" do
    assert_difference('Hashcard.count') do
      post :create, hashcard: @hashcard.attributes
    end

    assert_redirected_to hashcard_path(assigns(:hashcard))
  end

  test "should show hashcard" do
    get :show, id: @hashcard.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hashcard.to_param
    assert_response :success
  end

  test "should update hashcard" do
    put :update, id: @hashcard.to_param, hashcard: @hashcard.attributes
    assert_redirected_to hashcard_path(assigns(:hashcard))
  end

  test "should destroy hashcard" do
    assert_difference('Hashcard.count', -1) do
      delete :destroy, id: @hashcard.to_param
    end

    assert_redirected_to hashcards_path
  end
end
