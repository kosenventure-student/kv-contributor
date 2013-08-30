require 'test_helper'

class UserGreetersControllerTest < ActionController::TestCase
  test "should get greet" do
    get :greet
    assert_response :success
  end

end
