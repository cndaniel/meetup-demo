require 'rails_helper'

RSpec.describe MeetupsController, type: :controller do
  describe 'GET index' do

    it 'assgins @meetups' do
      meetup1 = create(:meetup)
      meetup2 = create(:meetup)
      get :index
      expect(assigns[:meetups]).to eq([meetup1, meetup2])
   end
   it 'renders template' do
     meetup1 = create(:meetup)
     meetup2 = create(:meetup)
      get :index
      expect(response).to render_template("index")
   end
  end

  describe 'GET show' do
    it 'assigns @meetup' do
      meetup = create(:meetup)
      get :show, params: { id: meetup.id }

      expect(response).to render_template('show')
    end
  end

  describe 'get new' do
    context 'when user login' do
      let(:user) { create(:user) }
      before do
        sign_in user
        get :new
      end

    it 'assigns @meetup' do

      get :new
      expect(assigns(:meetup)).to be_a_new(Meetup)
    end
    it 'renders template' do
      expect(response).to render_template("new")
    end
  end

  describe 'POST create' do
    let(:user){ create(:user)}
    before do
      sign_in user
    end
    context 'when meetup has a title' do
    it "creates a new meetup" do
      meetup = build(:meetup)

      expect do
        post :create, params: { meetup: attributes_for(:meetup) }
      end.to change{ Meetup.count }.by(1)
    end

    it "redirects to meetups_path" do
      meetup = build(:meetup)
      post :create, params: { meetup: attributes_for(:meetup)}

      expect(response).to redirect_to meetups_path
    end

    it "creates a meetup for user" do
      meetup = build(:meetup)

      post :create, params: {meetup: attributes_for(:meetup)}

      expect(Meetup.last.user).to eq(user)
    end
  end

  context 'when meetup does not have a title' do
    it "does not create a record when meetup doesn't have a title" do
      expect do
        post :create, params: { meetup: { description: "foo"} }
      end.to change { Meetup.count}.by(0)
    end

    it "renders a new template when meetup without a title fails to create" do
      meetup = build(:meetup)

      post :create, params:{ meetup:{ description: "bar"}}

      expect(response).to render_template('new')
    end
  end
end

end

end
