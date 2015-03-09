require 'test_helper'

class ImportControllerTest < ActionController::TestCase
  test "should get colorgemimport" do
    get :colorgemimport
    assert_response :success
  end

end
