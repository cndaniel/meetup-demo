class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :meetup_relationships
  has_many :participated_meetups, through: :meetup_relationships, source: :meetup
  has_many :comments
  has_many :meetups

end
