class AdminMailer < ApplicationMailer

  default from: 'admin@batchcookerz.fr'

  def new_user_email_to_admin(user)
    
    @admin_email = 'admin@batchcookerz.fr'
    @user = user
    @url  = 'http://batchcookerz.fr'

    mail(
      to: 'admin@batchcookerz.fr',
      subject: "Un nouvel utilisateur s'est inscrit ! :)")
  end

end
