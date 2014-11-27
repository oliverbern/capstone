require 'test_helper'

class DiamondsControllerTest < ActionController::TestCase
  setup do
    @diamond = diamonds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diamonds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diamond" do
    assert_difference('Diamond.count') do
      post :create, diamond: { clarity: @diamond.clarity, color: @diamond.color, condculet: @diamond.condculet, condgirdle: @diamond.condgirdle, conditioncut: @diamond.conditioncut, description: @diamond.description, height: @diamond.height, length: @diamond.length, shape: @diamond.shape, sizeculet: @diamond.sizeculet, treatment: @diamond.treatment, weight: @diamond.weight, weight: @diamond.weight, width: @diamond.width }
    end

    assert_redirected_to diamond_path(assigns(:diamond))
  end

  test "should show diamond" do
    get :show, id: @diamond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diamond
    assert_response :success
  end

  test "should update diamond" do
    patch :update, id: @diamond, diamond: { clarity: @diamond.clarity, color: @diamond.color, condculet: @diamond.condculet, condgirdle: @diamond.condgirdle, conditioncut: @diamond.conditioncut, description: @diamond.description, height: @diamond.height, length: @diamond.length, shape: @diamond.shape, sizeculet: @diamond.sizeculet, treatment: @diamond.treatment, weight: @diamond.weight, weight: @diamond.weight, width: @diamond.width }
    assert_redirected_to diamond_path(assigns(:diamond))
  end

  test "should destroy diamond" do
    assert_difference('Diamond.count', -1) do
      delete :destroy, id: @diamond
    end

    assert_redirected_to diamonds_path
  end
end
