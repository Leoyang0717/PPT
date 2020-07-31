class Post < ApplicationRecord
  belongs_to :board
  validates :title, presence: true
  validates :serial,uniqueness: true

  before_create :create_serial

  private
  def create_serial
    self.serial = serial_generator(10)
  end
  def serial_generator(n)
    ([*0..9,*'a'..'z',*'A'..'Z'] - ['i',1,'l',0,'o','I']).sample(n).join  
  end
end
