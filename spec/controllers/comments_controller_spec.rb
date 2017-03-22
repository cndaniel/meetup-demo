require 'rails_helper'

RSpec.describe CommentsController, type: :controller do


    context "when user signs in" do
      let(:user) { create(:user) }
      let(:meetup){ create(:meetup)}

      before do
        sign_in user
      end
      it "creates a new comments" do

        expect do
          post :create, params: { meetup_id: meetup.id, comment:{ content: "trolling" } }
        end.to change{ Comment.count}.by(1)
      end

      it "create a comment from the user" do
        post :create, params: { meetup_id: meetup.id, comment:{ content: "trolling" } }
        expect(Comment.last.user).to eq(user)
    end

      it "redirect_to meetups#show page" do
        post :create, params: { meetup_id: meetup.id, comment:{ content: "trolling" } }
        expect(response).to redirect_to meetup_path(meetup)
      end
  end

  context "when user not sign in" do

    let(:meetup){ create(:meetup)}
    it "cannot create a new comments" do
      expect do
        post :create, params: { meetup_id: meetup.id, comment:{ content: "trolling" } }
      end.to change{ Comment.count}.by(0)

    end
  end
end
