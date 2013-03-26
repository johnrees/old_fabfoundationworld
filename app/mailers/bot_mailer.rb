class BotMailer < ActionMailer::Base
  default from: "fablabbot@gmail.com"
  def new_lab lab
    @lab = lab
    mail to: "john@bitsushi.com", subject: "New Lab Added"
  end
end
