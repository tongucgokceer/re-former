class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { maximum: 12 }
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { maximum: 6 }
end
