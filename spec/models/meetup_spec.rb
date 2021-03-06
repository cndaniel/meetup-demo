require 'rails_helper'

RSpec.describe Meetup, type: :model do
  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to belong_to(:user)}
  it { should have_many(:comments)}
  it { should have_many(:meetup_relationships)}
  it { should have_many(:members).through(:meetup_relationships).source(:user)}
end
