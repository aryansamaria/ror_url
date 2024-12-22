require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  
  test "visiting the index" do
    log_in_as(username: 'aryan', password: "123aryan")
    visit root_path
    assert_selector "a.navbar-brand", text: /Jump News/i, wait: 5
    assert_selector "#comment", text: /Comments/i, wait: 5
    click_on "Comments"
    assert_selector '#show', text: /Showcase/i, wait: 5
    click_on "Showcase"
    
    assert_selector '#signup', text: /Sign Up/i, wait: 5
    click_on "Sign Up"
    
    fill_in "Username", with: "aryann"
    fill_in "Password", with: "12345678"
    click_on "Register"
   
    assert_selector '#sub', text: /Submit a Link/i, wait: 5
    click_on "Submit a Link"

    fill_in "title", with: "link test"
    fill_in "url", with: "https://guides.rubyonrails.org/testing.html#system-testing"
    fill_in "description", with: "A guide for system test to ruby on rails"

    click_on "Create Link"
    
    link = Link.find_by(title: "link test")

    assert_equal link.upvotes, 0, "Initial upvote count is not 0"
    find("a[href='#{upvote_link_path(link)}']").click

    find("a[href='#{upvote_link_path(link)}']").click

   
    within("#navlinks", text: "link test") do
      find("#link-comment").click
    end
    
    fill_in "Your comment...", with: "Test comment"
    click_on "Add", wait: 5

    take_screenshot
  end
end
