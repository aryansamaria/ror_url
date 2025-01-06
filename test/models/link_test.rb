require "test_helper"

class LinkTest < ActiveSupport::TestCase
  test "link has a title" do
    link = links(:rails)
    assert_equal "Ruby on Rails", link.title
    assert_equal "https://rubyonrails.org/", link.url
    assert_equal "A web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.", link.description
    assert_equal 1, link.votes.count
    assert link.valid?, "Link is valid"
  end

  test "link belongs to a user" do
    link = links(:rails)
    assert_not_nil link.user
    assert_equal "regular_user", link.user.username
  end
end
