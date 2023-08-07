class User < ApplicationRecord
    has_many :events, through: :attendances
    has_many :attendances

    validates :email, null: false, default: ""
    validates :encrypted_password, null: false, default: ""
end
