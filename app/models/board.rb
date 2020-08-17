class Board < ApplicationRecord
  acts_as_paranoid
  paginates_per 2
  has_many :posts

  has_many :board_masters
  has_many :users,through: :board_masters

  has_many :favorite_boards
  has_many :favorited_users,source: :user,through: :favorite_boards

  validates :title ,:intro, presence: true

  def favorited_by?(u)
    favorited_users.include?(u)
  end
  # def self.available
  #   where(deleted_at: nil)
  # end
  # default_scope { where(deleted_at: nil) }
  # scope :available, lambda { where(deleted_at: nil) }

  include AASM

  aasm(column: 'state') do # default column: aasm_state
    state :normal, initial: true
    state :hidden,:locked

    event :hide do
      transitions from: [:normal,:locked], to: :hidden
    end
    event :show do
      transitions from: :hidden, to: :locked
    end
    event :lock do
      transitions from: [:normal, :hidden], to: :locked

      after_transaction do
        puts "已鎖版"
      end
    end
    event :unlock do
      transitions from: :locked, to: :normal
    end
  end

end
