require 'rails_helper'

RSpec.describe "Infomations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/infomations/index"
      expect(response).to have_http_status(:success)
    end
  end

end
