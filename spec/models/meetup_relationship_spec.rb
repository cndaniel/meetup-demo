require 'rails_helper'

RSpec.describe MeetupRelationship, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:meetup)}
end
