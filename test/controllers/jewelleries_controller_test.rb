require 'test_helper'

class JewelleriesControllerTest < ActionController::TestCase
  setup do
    @jewellery = jewelleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jewelleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jewellery" do
    assert_difference('Jewellery.count') do
      post :create, jewellery: { certificate: @jewellery.certificate, companymade: @jewellery.companymade, description: @jewellery.description, material1: @jewellery.material1, material2: @jewellery.material2, material3: @jewellery.material3, owner: @jewellery.owner, stone1: @jewellery.stone1, stone2: @jewellery.stone2, stone3: @jewellery.stone3, title: @jewellery.title }
    end

    assert_redirected_to jewellery_path(assigns(:jewellery))
  end

  test "should show jewellery" do
    get :show, id: @jewellery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jewellery
    assert_response :success
  end

  test "should update jewellery" do
    patch :update, id: @jewellery, jewellery: { certificate: @jewellery.certificate, companymade: @jewellery.companymade, description: @jewellery.description, material1: @jewellery.material1, material2: @jewellery.material2, material3: @jewellery.material3, owner: @jewellery.owner, stone1: @jewellery.stone1, stone2: @jewellery.stone2, stone3: @jewellery.stone3, title: @jewellery.title }
    assert_redirected_to jewellery_path(assigns(:jewellery))
  end

  test "should destroy jewellery" do
    assert_difference('Jewellery.count', -1) do
      delete :destroy, id: @jewellery
    end

    assert_redirected_to jewelleries_path
  end
end
