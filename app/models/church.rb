class Church < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :email

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    church = Church.where(email: email).first
    if church && church.password_hash == BCrypt::Engine.hash_secret(password, church.password_salt)
      church
    else
      nil
    end
  end
end
