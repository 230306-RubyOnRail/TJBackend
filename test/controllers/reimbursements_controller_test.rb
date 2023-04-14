require "test_helper"

class ReimbursementsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user1 = users(:one)
    @user1_token = JSONWebToken.encode('user_id': @user1.id)
    @Auth_user1 = {'Authorization' => "Bearer #{@user1_token}"}


    @user2 = users(:two)
    @user2_token = JSONWebToken.encode('user_id': @user2.id)
    @Auth_user2 = {'Authorization' => "Bearer #{@user2_token}"}

    @reim1 = reimbursements(two)


  end

  
  test "should be able to update status as manager" do
    put '/reimbursements/:id', headers: @Auth_user1, params: {id: @reim1.id, status: "reviewed23"}, as: :json
    assert_equal "update", @controller.action_name
    assert_response :success
  end

  test "should not be able to update status as employee" do
    put '/reimbursements/:id', headers: @Auth_user2, params: {id: @reim1.id, status: "reviewed23"}, as: :json
    assert_equal "update", @controller.action_name
    assert_response :unauthorized
  end

  test "should be able to view their reimbursement as employee" do
    get '/reimbursements/:id', headers: @Auth_user2,as: :json
    assert_not_empty @response.body
    assert_response :success
  end

  test "should get index of all reimbursements as manager" do
    get '/reimbursements', headers: @Auth_user1, as: :json
    assert_match "reimbursement", @response.body
    assert_not_empty(@response.body)
    assert_response :success
  end

  test "should not show index for unauthorized user" do
    get '/reimbursements', headers:@Auth_user2, as: :json
    assert_response :unauthorized

  end

  
  test "should be able destroy any requests as a manager" do
    delete '/reimbursements/:id', headers: @Auth_user1, params: {id: @reim1.id}, as: :json
    assert_equal "delete", @controller.action_name
    assert_response :success
  end
end
  # test "should get index" do
  #   get reimbursements_index_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get reimbursements_create_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get reimbursements_show_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get reimbursements_update_url
  #   assert_response :success
  # end

  # test "should get delete" do
  #   get reimbursements_delete_url
  #   assert_response :success
  # end
end
