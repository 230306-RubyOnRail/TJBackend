require 'rails_helper'

RSpec.describe "Controllers", type: :request do
  describe "POST /reimbursements/new" do
    it "works!" do
      post reimbursements_path('title', 'description', false, 1000)
      expect(response).to have_http_status(201)
    end
  end
end

RSpec.describe "Controllers", type: :request do
  describe "get /reimbursements" do
    it "works!" do
      get reimbursements_path('title', 'description', false, 1000)
      expect(response).to have_http_status(201)
    end
  end
end

RSpec.describe "Controllers", type: :request do
  describe "PUT /reimbursements:id" do
    it "works!" do
      put reimbursements_path('title', 'description', false, 1000)
      expect(response).to have_http_status(201)
    end
  end
end

RSpec.describe "Controllers", type: :request do
  describe "DELETE /reimbursements/:id" do
    it "works!" do
      DELETE reimbursements_path(1000)
      expect(response).to have_http_status(201)
    end
  end
end

RSpec.describe "Controllers", type: :request do
  describe "CREATE /auth/login" do
    it "works!" do
      CREATE session
      expect(response).to have_http_status(201)
    end
  end
end

RSpec.describe "Controllers", type: :request do
  describe "CREATE users" do
    it "works!" do
      CREATE users_path()
      expect(response).to have_http_status(201)
    end
  end
end