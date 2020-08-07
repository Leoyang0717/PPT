class Board < ApplicationRecord
  has_many :posts

  has_many :board_masters
  has_many :users,through: :board_masters

  has_many :favorite_boards
  has_many :favorited_users,source: :user,through: :favorite_boards

  acts_as_paranoid

  validates :title ,:intro, presence: true

  # def self.available
  #   where(deleted_at: nil)
  # end
  # default_scope { where(deleted_at: nil) }
  # scope :available, lambda { where(deleted_at: nil) }

end
