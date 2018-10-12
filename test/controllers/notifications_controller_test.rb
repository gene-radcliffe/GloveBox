require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get reminder" do
    get notifications_reminder_url
    assert_response :success
  end

end
