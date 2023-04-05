require "test_helper"

class ReimbusementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reimbusements_index_url
    assert_response :success
  end

  test "should get create" do
    get reimbusements_create_url
    assert_response :success
  end

  test "should get show" do
    get reimbusements_show_url
    assert_response :success
  end

  test "should get update" do
    get reimbusements_update_url
    assert_response :success
  end

  test "should get delete" do
    get reimbusements_delete_url
    assert_response :success
  end
end
