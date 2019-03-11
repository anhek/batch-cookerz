class UserMailer < ApplicationMailer

  default from: 'admin@batchcookerz.fr'
 
  def welcome_email_to_new_user(user)

    @user = user 
    @url  = 'http://batchcookerz.fr'

    mail(
      to: @user.email, 
      subject: "L'équipe de BatchCookerz te souhaite la bienvenue !")
  end

end