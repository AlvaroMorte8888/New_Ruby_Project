class User < ApplicationRecord::Base
    validates :name, presence: true, lenght: {maximum: 50}
    validates :email, presence: true, lenght: {maximum: 255}
  has_secure_password
end
