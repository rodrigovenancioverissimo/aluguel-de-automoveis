require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it 'responds a 302 response (not authorized)' do
    get :home
    expect(response).to have_http_status(302)
  end

  it 'responds a 200 response (authorized)' do
    admin = create(:admin)
    sign_in admin
    expect(response).to have_http_status(200)
  end
end