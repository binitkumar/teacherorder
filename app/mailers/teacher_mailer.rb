class TeacherMailer < ActionMailer::Base
  default from: "telmnoreply@gmail.com"

  def registration(email)
    @email = email
    mail(to: @email, subject: 'Email verification mail')
  end
end
