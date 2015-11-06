class UserMailerTest < ActionMailer::TestCase
  tests UserMailer

  def test_send_alert
  User.all.each do |c|
    email = UserMailer.send_alert(c).deliver
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal [c.email], email.to
    assert_equal "Message from manager", email.subject
  end
end
end
