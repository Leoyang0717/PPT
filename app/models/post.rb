class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user
  validates :title, presence: true
  validates :serial,uniqueness: true
  has_many :comments
  
  before_create :create_serial

  def display_username
    if user.nil?
      "未知者"
    else
      user.account
    end
  end

  private
  def create_serial
    self.serial = serial_generator(10)
  end
  def serial_generator(n)
    ([*0..9,*'a'..'z',*'A'..'Z'] - ['i',1,'l',0,'o','I']).sample(n).join  
  end
end
