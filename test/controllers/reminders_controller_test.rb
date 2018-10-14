require 'test_helper'

class RemindersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reminders_new_url
    assert_response :success
  end

end
