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
    it 'assigns @course' do
      meetup = create(:meetup)
      get :show, params: { id: meetup.id }

      expect(response).to render_template('show')
    end
  end

  describe 'get new' do
    it 'assigns @course' do
      meetup = build(:meetup)
      get :new
      expect(assigns(:meetup)).to be_a_new(Meetup)
    end
    it 'renders template' do
      meetup = build(:meetup)

      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
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
  end

end
