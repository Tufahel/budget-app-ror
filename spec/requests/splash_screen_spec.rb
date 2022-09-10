require 'rails_helper'

describe 'SplashScreens', type: :request do
  before(:each) { get root_path }

  context 'index' do
    it 'GET /index returns okay status' do
      expect(response).to have_http_status(200)
    end

    it 'GET /index renders correct template(index)' do
      expect(response).to render_template(:index)
    end

    it 'GET /index include correct placeholder text' do
      expect(response.body).to include('Budget Tracker')
    end
  end
end