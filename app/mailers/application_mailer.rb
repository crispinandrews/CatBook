class ApplicationMailer < ActionMailer::Base
  default from: 'cathubclonezone@gmail.com'
  layout 'mailer'

  def send_new_user_message(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to CatHub!")
  end

end
