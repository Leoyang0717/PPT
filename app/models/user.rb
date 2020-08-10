class User < ApplicationRecord
  require 'digest'
  
  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # ,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  before_create :encrypt_password
  
  has_many :board_masters
  has_many :boards,through: :board_masters
  
  has_many :favorite_boards
  has_many :favorited_boards,through: :favorite_boards,source: :board

  has_many :posts
  has_many :comments
  
  def self.login(options)
    if options[:account] && options[:password]
      find_by(account: options[:account],
              password: Digest::SHA1.hexdigest("x" + options[:password] + "y"))
    else
      return nil #可不寫
    end
  end

  def toggle_favorite(board)
    if favorited_boards.exists?(board.id)
      favorited_boards.destroy(board)
    else
      favorited_boards << board
    end   
  end

  private
  def encrypt_password
    self.password = bigbang(self.password)
  end

  def bigbang(string)
    string = "x" + string + "y"
    Digest::SHA1.hexdigest(string)
  end
  def self.aaa
    puts "aaa"
  end
end
