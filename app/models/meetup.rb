class Meetup < ApplicationRecord
  validates :title, presence: true
  has_many :members, through: :meetup_relationships, source: :user
  has_many :meetup_relationships
  has_many :comments
  belongs_to :user

end
