require 'rails_helper'

RSpec.describe "Settings", type: :request do
  describe "GET /settings" do
    it "works! (now write some real specs)" do
      get settings_path
      expect(response).to have_http_status(302)
    end
  end
end
