require "rails_helper"

RSpec.describe "API_V1::Meetups", type: :request do
  describe "Get /meetup/id" do
    before do
      meetup = create(:meetup)
      user = create(:user)
      comment = create(:comment)

      get "api/v1/meetups/#{meetup.id}"
    end

    it 'returns sucesss http status and content_type' do
      expect(response).to have_http_status(200)

      expect(response.content_type).to eq(Mime[:json])
    end

    it 'returns meetups with user and comments' do
       json_body = JSON.parse(response.body).with_indifferent_access

      expect(json_body).to match(
        id: meetup.id,
        title: meetup.title,
        descripition: meetup.descripition,
        user: [
          email: user.email,
        ],
        comments: [
          content: comment.content,
          reliant: comment.user
        ]
      )
    end
  end
end
