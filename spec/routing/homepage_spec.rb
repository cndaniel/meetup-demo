require "rails_helper"

RSpec.describe "Homepage" do
  it "routes root path to course #index" do
    expect(get:"/").to route_to(controller: "meetups", action:"index" )
  end
end
