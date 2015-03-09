require 'test_helper'

class ExportControllerTest < ActionController::TestCase
  test "should get colorgemexport" do
    get :colorgemexport
    assert_response :success
  end

end
