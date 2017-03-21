require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:meetups)}
  it { is_expected.to have_many(:comments)}
  it { is_expected.to have_many(:meetup_relationships)}
  it { should have_many(:participated_meetups).through(:meetup_relationships).source(:meetup)} 
end
