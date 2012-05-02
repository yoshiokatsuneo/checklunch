require 'test_helper'

class AllmenusControllerTest < ActionController::TestCase
  setup do
    @allmenu = allmenus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allmenus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allmenu" do
    assert_difference('Allmenu.count') do
      post :create, allmenu: { date: @allmenu.date, price: @allmenu.price, title: @allmenu.title }
    end

    assert_redirected_to allmenu_path(assigns(:allmenu))
  end

  test "should show allmenu" do
    get :show, id: @allmenu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allmenu
    assert_response :success
  end

  test "should update allmenu" do
    put :update, id: @allmenu, allmenu: { date: @allmenu.date, price: @allmenu.price, title: @allmenu.title }
    assert_redirected_to allmenu_path(assigns(:allmenu))
  end

  test "should destroy allmenu" do
    assert_difference('Allmenu.count', -1) do
      delete :destroy, id: @allmenu
    end

    assert_redirected_to allmenus_path
  end
end
