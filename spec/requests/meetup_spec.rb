require 'rails_helper'

RSpec.describe 'API_V1::Meetups', type: :request do
  describe 'Get /meetups' do
    before do
      @user = User.create!(email: 'h1@example.com', password: '12345678', password_confirmation: '12345678')
      @meetup1 = Meetup.create!(title:"meetup1", description:"I am an useless description.", user:@user)
      @meetup2 = Meetup.create!(title:"meetup2", description:"I am an useless description.", user:@user)
      get '/api/v1/meetups'
    end
    it 'returns valid response conetents' do
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])
    end
    it 'return a lists of meetups' do
      expected_result = [
        { "id": @meetup1.id,
          "title": @meetup1.title,
          "description": @meetup1.description
        },{
          "id": @meetup2.id,
            "title": @meetup2.title,
            "description": @meetup2.description
        }
      ]

      expect(response.body).to eq(expected_result.to_json)
    end
  end
  describe 'Get /meetup/id' do
    context 'when user with valid authenticate_token' do
      before do
        @user = User.create!(email: 'h1@example.com', password: '12345678', password_confirmation: '12345678')
        @meetup = Meetup.create!(title: 'hi', description: 'this is awesome', user: @user)
        @comment = Comment.create!(content: 'troll!', user_id: @user.id, meetup_id: @meetup.id)
        @comment.user = @user

        get "/api/v1/meetups/#{@meetup.id}", headers: { 'Authorization' => "Token token=#{@user.auth_token}" }
      end

      it 'returns sucesss http status and content_type' do
        expect(response).to have_http_status(200)

        expect(response.content_type).to eq(Mime[:json])
      end

      it 'returns meetups with user and comments' do
        json_body = JSON.parse(response.body).with_indifferent_access
        expect(json_body).to match(
          id: @meetup.id,
          title: @meetup.title,
          description: @meetup.description,
          user: @user.email,
          comments: [
            content: @comment.content,
            repliant: @comment.user.email
          ]
        )
      end
    end

    context 'when user tried to get list without valid token' do
      before do
        @user = User.create!(email: 'h1@example.com', password: '12345678', password_confirmation: '12345678')
        @meetup = Meetup.create!(title: 'hi', description: 'this is awesome', user: @user)
        @comment = Comment.create!(content: 'troll!', user_id: @user.id, meetup_id: @meetup.id)
        @comment.user = @user

        get "/api/v1/meetups/#{@meetup.id}", headers: { 'Authorization' => 'Token token=sdfdfdff' }
      end
      it 'returns error message' do
        expect(response).to have_http_status(401)
        expect(response.body).to eq('bad crendentials')
      end
    end
  end
end
