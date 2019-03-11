class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, through: :comments
  has_many :recipes, through: :likes
  has_many :menus

  after_create :send_welcome_email_to_new_user, :send_new_user_email_to_admin

  def send_welcome_email_to_new_user
    UserMailer.welcome_email_to_new_user(self).deliver_now
  end

  def send_new_user_email_to_admin
    AdminMailer.new_user_email_to_admin(self).deliver_now
  end

end
