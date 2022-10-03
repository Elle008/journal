require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users (:user_001)
    post user_session_url
  end
  
  test 'access show' do
    get new_category_path
    assert_response :success
  end


end
