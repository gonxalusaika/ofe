class UserMailer < ActionMailer::Base
  default from: "oculus@education.com"

  def confirmacion_registro(user)
  	@user = user
  	mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>", subject: "Bienvenido a Oculus for Education")
  end
end
