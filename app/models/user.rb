class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :email, :password
  validates_uniqueness_of :email

  has_many :projects
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :focuses, join_table: "focuses_users"

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def organization?
    self.type == "Organization"
  end

  def volunteer?
    self.type == "Volunteer"
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
