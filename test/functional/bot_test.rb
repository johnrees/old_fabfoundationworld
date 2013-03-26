require 'test_helper'

class BotTest < ActionMailer::TestCase
  test "new_lab" do
    mail = Bot.new_lab
    assert_equal "New lab", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
