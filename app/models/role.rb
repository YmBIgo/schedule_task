class Role < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :workurl, presence: true, uniqueness: true, length: {maximum: 24}
  
  def email_required?
    false
  end

  def email_changed?
    false
  end

end
