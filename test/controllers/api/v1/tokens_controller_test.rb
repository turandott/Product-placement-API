require 'test_helper'

class Api::V1::TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # test "should get create" do
  #   get api_v1_tokens_create_url
  #   assert_response :success
  # end

  test 'should get JWT token' do
    post api_v1_tokens_url, params:{user: {email: @user.email, password: 'passssss'}}, as: :json
    assert_response :success

    json_response=JSON.parse(response.body)
    assert_not_nil json_response['token']
  end

  test 'should not get JWT token' do
    post api_v1_tokens_url, params: {user: {email: @user.email, password: 'not_passs'}}, as: :json
    assert_response :unauthorized
  end


  # test "should forbid destroy user because JWT is invalid" do
  #   assert_no_difference('User.count') do
  #     delete api_v1_user_url(@user), headers: { Authorization: JWT.encode({user_id: @user.id}, 'bad_signature')}, as: :json
  #   end
  #   assert_response :forbidden
  # end
end
