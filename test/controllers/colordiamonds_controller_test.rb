require 'test_helper'

class ColordiamondsControllerTest < ActionController::TestCase
  setup do
    @colordiamond = colordiamonds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colordiamonds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colordiamond" do
    assert_difference('Colordiamond.count') do
      post :create, colordiamond: { bycolor1: @colordiamond.bycolor1, bycolor2: @colordiamond.bycolor2, clarity: @colordiamond.clarity, color: @colordiamond.color, condculet: @colordiamond.condculet, condgirdle: @colordiamond.condgirdle, conditioncut: @colordiamond.conditioncut, description: @colordiamond.description, diamondcertificate: @colordiamond.diamondcertificate, height: @colordiamond.height, intensitecolor: @colordiamond.intensitecolor, length: @colordiamond.length, shape: @colordiamond.shape, sizeculet: @colordiamond.sizeculet, treatment: @colordiamond.treatment, weight: @colordiamond.weight, weight: @colordiamond.weight, width: @colordiamond.width }
    end

    assert_redirected_to colordiamond_path(assigns(:colordiamond))
  end

  test "should show colordiamond" do
    get :show, id: @colordiamond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colordiamond
    assert_response :success
  end

  test "should update colordiamond" do
    patch :update, id: @colordiamond, colordiamond: { bycolor1: @colordiamond.bycolor1, bycolor2: @colordiamond.bycolor2, clarity: @colordiamond.clarity, color: @colordiamond.color, condculet: @colordiamond.condculet, condgirdle: @colordiamond.condgirdle, conditioncut: @colordiamond.conditioncut, description: @colordiamond.description, diamondcertificate: @colordiamond.diamondcertificate, height: @colordiamond.height, intensitecolor: @colordiamond.intensitecolor, length: @colordiamond.length, shape: @colordiamond.shape, sizeculet: @colordiamond.sizeculet, treatment: @colordiamond.treatment, weight: @colordiamond.weight, weight: @colordiamond.weight, width: @colordiamond.width }
    assert_redirected_to colordiamond_path(assigns(:colordiamond))
  end

  test "should destroy colordiamond" do
    assert_difference('Colordiamond.count', -1) do
      delete :destroy, id: @colordiamond
    end

    assert_redirected_to colordiamonds_path
  end
end
