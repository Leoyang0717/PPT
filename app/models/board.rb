class Board < ApplicationRecord
  has_many :post

  acts_as_paranoid

  validates :title ,:intro, presence: true

  # def self.available
  #   where(deleted_at: nil)
  # end
  # default_scope { where(deleted_at: nil) }
  # scope :available, lambda { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end
end
