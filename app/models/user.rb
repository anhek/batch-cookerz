class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, through: :comments
  has_many :recipes, through: :likes
  has_many :menus

  has_one_attached :avatar

  # before_create :default_image

  after_create :send_welcome_email_to_new_user, :send_new_user_email_to_admin, :attribute_menu_to_new_user

  has_many :likes, dependent: :destroy
  
  # # Email validation
  # validates :email, 
  # presence: true,
  # uniqueness: true,
  # format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  # # Password validation
  # PASSWORD_FORMAT = /\A
  # (?=.{8,})          # Must contain 8 or more characters
  # (?=.*\d)           # Must contain a digit
  # # (?=.*[a-z])        # Must contain a lower case character
  # # (?=.*[A-Z])        # Must contain an upper case character
  # # # (?=.*[[:^alnum:]]) # Must contain a symbol
  # /x

  # validates :password, 
  #   presence: true, 
  #   length: { in: Devise.password_length }, 
  #   format: { with: PASSWORD_FORMAT }, 
  #   confirmation: true, 
  #   on: :create 

  # validates :password, 
  #   allow_nil: true, 
  #   length: { in: Devise.password_length }, 
  #   format: { with: PASSWORD_FORMAT }, 
  #   confirmation: true, 
  #   on: :update

  def send_welcome_email_to_new_user
    UserMailer.welcome_email_to_new_user(self).deliver_now
  end
   
  def send_new_user_email_to_admin
    AdminMailer.new_user_email_to_admin(self).deliver_now
  end

  def default_image
    self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user_default_picture.jpg')), filename: 'user_default_picture.jpg', content_type: 'image/jpg')
  end 

  def thumbnail
    return self.avatar.variant(resize: '100x100')
  end

  def attribute_menu_to_new_user
    Menu.create!(user_id: User.last.id, number_of_recipes: 0)
  end

  def find_liked_recipes(likes)
    recipes_ids = []
    likes.each do |like|
      recipes_ids << like.recipe_id
    end 
    recipes =[]
    recipes_ids.each do |id|
      recipes << Recipe.find(id)
    end 
    return recipes
  end

end
