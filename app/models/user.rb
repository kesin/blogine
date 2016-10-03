class User < ApplicationRecord
  attr_accessor :password

  before_save :encrypt_password
  after_save :empty_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, presence: true, length: 6..20

  def valid_password(password)
    password_digest == BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate_user(name_or_email, password)
    user = User.find_by_email(name_or_email) || User.find_by_name(name_or_email)
    user && user.valid_password(password) ? user : false
  end

  def generate_remember_token
    BCrypt::Engine.hash_secret(SecureRandom.hex(10), BCrypt::Engine.generate_salt)
  end

  def remember_me
    self.update_attribute(:remember_token, generate_remember_token)
  end

  def forget_me
    self.update_attribute(:remember_token, nil)
  end

  def authenticate_with_remember(remember_token)
    remember_token == self.remember_token
  end

  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def empty_password
    self.password = nil
  end

end
