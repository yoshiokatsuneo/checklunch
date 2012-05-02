require 'test_helper'

class RestrantsControllerTest < ActionController::TestCase
  setup do
    @restrant = restrants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restrant" do
    assert_difference('Restrant.count') do
      post :create, restrant: { logo_url: @restrant.logo_url, name: @restrant.name, url: @restrant.url }
    end

    assert_redirected_to restrant_path(assigns(:restrant))
  end

  test "should show restrant" do
    get :show, id: @restrant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restrant
    assert_response :success
  end

  test "should update restrant" do
    put :update, id: @restrant, restrant: { logo_url: @restrant.logo_url, name: @restrant.name, url: @restrant.url }
    assert_redirected_to restrant_path(assigns(:restrant))
  end

  test "should destroy restrant" do
    assert_difference('Restrant.count', -1) do
      delete :destroy, id: @restrant
    end

    assert_redirected_to restrants_path
  end
end
