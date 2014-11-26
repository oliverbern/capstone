require 'test_helper'

class ColorgemsControllerTest < ActionController::TestCase
  setup do
    @colorgem = colorgems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colorgems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colorgem" do
    assert_difference('Colorgem.count') do
      post :create, colorgem: { color: @colorgem.color, gemscertificate: @colorgem.gemscertificate, gemstonetype: @colorgem.gemstonetype, height: @colorgem.height, length: @colorgem.length, shape: @colorgem.shape, weight: @colorgem.weight, width: @colorgem.width }
    end

    assert_redirected_to colorgem_path(assigns(:colorgem))
  end

  test "should show colorgem" do
    get :show, id: @colorgem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colorgem
    assert_response :success
  end

  test "should update colorgem" do
    patch :update, id: @colorgem, colorgem: { color: @colorgem.color, gemscertificate: @colorgem.gemscertificate, gemstonetype: @colorgem.gemstonetype, height: @colorgem.height, length: @colorgem.length, shape: @colorgem.shape, weight: @colorgem.weight, width: @colorgem.width }
    assert_redirected_to colorgem_path(assigns(:colorgem))
  end

  test "should destroy colorgem" do
    assert_difference('Colorgem.count', -1) do
      delete :destroy, id: @colorgem
    end

    assert_redirected_to colorgems_path
  end
end
