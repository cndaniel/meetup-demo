require 'rails_helper'

RSpec.describe 'API_V1::Auth', type: :request do
  describe 'valid login and out and token generation' do
    it 'can let user login and get auth token ' do
      user = create(:user)
      post '/api/v1/login', params: { email: user.email, password: 'password' }

      expect(response).to have_http_status(200)

      user = User.last

      expect(response.body).to eq(
        {
          message: 'Ok',
          auth_token: user.auth_token,
          user_id: user.id
        }.to_json
      )
    end

    it 'can not let user logout without valid info' do
      user = create(:user)

      post '/api/v1/logout', params: { email: user.email, password: 'password' }
      expect(response).to have_http_status(401)
    end

    it 'destorys the session token by loging out' do
      user = create(:user)

      post '/api/v1/logout', params: { auth_token: user.auth_token }
      expect(response).to have_http_status(200)
      expect(User.last.auth_token).not_to eq(user.auth_token)
    end

    it 'wont let user with invalid information to login' do
      post '/api/v1/login', params: { email: '1@1.com', password: 'xxxxxx' }

      expect(response).to have_http_status(401)
      expect(response.body).to eq(
        { message: 'wrong login information!' }.to_json
      )
    end
  end

  describe 'registration' do
    it 'can let user to sign up' do
      post '/api/v1/signup', params: { email: 'daniel@example.com', password: '12345678' }

      expect(response).to have_http_status(200)

      new_user = User.last
      expect(new_user.email).to eq('daniel@example.com')
      expect(response.body).to eq({ user_id: new_user.id }.to_json)
    end

    it 'let register with invalid info fail' do
      post '/api/v1/signup', params: { email: 'daniel@example.com' }
      expect(response).to have_http_status(400)
      expect(response.body).to eq({ message: 'Failed', errors: { password: ["can't be blank"] } }.to_json)
    end
  end
end
