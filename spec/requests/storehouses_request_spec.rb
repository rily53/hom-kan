require 'rails_helper'

RSpec.describe "Storehouses", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/storehouses/index"
      expect(response).to have_http_status(:success)
    end
  end

end
