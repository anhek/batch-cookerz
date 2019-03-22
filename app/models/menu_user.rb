class MenuUser < ApplicationRecord

  belongs_to :menu
  belongs_to :user
  
end
