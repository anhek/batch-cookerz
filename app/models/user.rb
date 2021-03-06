class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :default_image
  after_create :send_welcome_email_to_new_user, :send_new_user_email_to_admin, :attribute_menu_to_new_user
  before_save :default_values

  has_many :recipes, through: :comments
  has_many :recipes, through: :likes
  has_many :menus, dependent: :destroy
  has_many :recipes
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  def send_welcome_email_to_new_user
    UserMailer.welcome_email_to_new_user(self).deliver_now
  end
   
  def send_new_user_email_to_admin
    AdminMailer.new_user_email_to_admin(self).deliver_now
  end

  def default_image
    self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'maite.jpg')), filename: 'maite.jpg', content_type: 'image/jpg')
  end 

  def thumbnail
    return self.avatar.variant(resize: '100x100')
  end

  def attribute_menu_to_new_user
    Menu.create!(user_id: User.last.id, number_of_people: 1)
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

  def default_values
    self.nickname ||= "Utilisateur anonyme"
    self.is_admin ||= false
  end

end
