require 'rails_helper'

feature "register and login", type: :feature do
  scenario "login and logout" do
  visit "/users/sign_up"

  expect(page).to have_content("Sign up")

  within("#new_user") do
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
  end

  click_button "Sign up"

    expect(page).to have_text "user@example.com"
    user = User.last
    expect(user.email).to eq("user@example.com")
  end


   scenario "existing user signs in" do
     create(:user, email: "user@example.com", password: "password")

     visit "/users/sign_in"

     within(".new_user") do
     fill_in "Email", with: "user@example.com"
     fill_in "Password", with: "password"
      end

      click_button "Log in"

      expect(page).to have_text "user@example.com"
    end


    scenario "user signs out" do
    create(:user, email: "user@example.com", password: "password")

    visit "/users/sign_in"
    within(".new_user") do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
    end

    click_button "Log in"

    click_link "Logout"
    expect(page).not_to have_text "user@example.com"
  end

  end
