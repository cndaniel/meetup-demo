class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :meetup_relationships
  has_many :participated_meetups, through: :meetup_relationships, source: :meetup
  has_many :comments
  has_many :meetups
  before_create :generate_auth_token
  def generate_auth_token
    self.auth_token = Devise.friendly_token
  end

  def reset_auth_token
    generate_auth_token
    save
  end
end
