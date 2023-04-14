require "test_helper"

class ReimbursementsControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe "Test", type: :request do
    describe "request list of all tests" do
      user = User.create(title: 'title', description: 'description', approved: false, user_id: 1000)
      get 'reimbursements/new'
      expect(response)
      expect(response.body).to include("Test User")
    end
  end
end
