require 'rails_helper'

RSpec.describe CsvUploadsController, type: :controller do
  describe "GET /index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /upload" do
    it 'returns http success' do
      post :upload, params: {:file => fixture_file_upload(Rails.root.join('spec/dummy/users.csv'))}
      details = session[:details]
      expect(details[0]).to eq "Muhammad was successfully saved"
      expect(details[1]).to eq "Change 1 character of Maria Turing's password"
      expect(details[2]).to eq "Change 4 character of Isabella's password"
      expect(details[3]).to eq "Change 5 character of Axel's password"
      expect(details[4]).to eq "Change 9 character of abc's password"
      expect(response).to redirect_to(root_path)
    end
  end
end
