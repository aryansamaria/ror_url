require "test_helper"
require "capybara/cuprite"

module ApplicationSystemTestCaseHelper

  def sign_up_as(username:, password:)
    visit new_user_path 
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Sign Up'
  end

  def log_in_as(username:, password:)
    visit new_session_path
    fill_in 'Username', with: 'aryan'
    fill_in 'Password', with: '123aryan'
    click_button 'Log in'
  end
end


class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include ApplicationSystemTestCaseHelper
  driven_by :cuprite, using: :headless_firefox, screen_size: [ 1400, 1400 ], options: { timeout: 15 }
end
