# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  password_salt   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#

class User < ApplicationRecord
  attr_accessor :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, presence: true, length: 6..20
  validates :password_salt, presence: true
  validates :password_digest, presence: true

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

end
