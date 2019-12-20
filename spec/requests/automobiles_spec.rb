require 'rails_helper'

RSpec.describe "Automobiles", type: :request do
  describe "GET /automobiles" do
    it "works! (now write some real specs)" do
      get automobiles_path
      expect(response).to have_http_status(200)
    end
  end
end
