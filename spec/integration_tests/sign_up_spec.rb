require 'rails_helper'

describe "the signup process" do
  it "signs up a new user" do
    # Got to users/sign_in page
    visit '/users/sign_in'
    # Click on sign_up link (either at bottom of page or on right side)
    first('form.new_user+a').click
    # Redirect to users/sign-up page
    expect(current_path).to eq new_user_registration_path
    # expect(current_path).to eq(post_comments_path(post))

    user = User.create(:email => 'useraccount', :password => 'thisIsASecretPassword')
    # fill_in email address
    fill_in 'user_email', :with => 'useraccount@example.com'
    # fill_in password
    fill_in 'user_password', :with => 'thisIsASecretPassword'
    # fill_in complete password confirm
    fill_in 'user_password_confirmation', :with => 'thisIsASecretPassword'
    # click_button sign_up
    click_button 'Sign up'
    # redirect to_root
    expect(current_path).to eq(root_path)
    # confirm that success message is posted on root page
    page.should have_content 'Welcome'
  end
end
