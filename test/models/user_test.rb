require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test 'Should not save without First name' do
    user = User.new
    user.email = 'xyz@woohoo.com'
    assert_not user.save, 'saved without First name'
  end
end
