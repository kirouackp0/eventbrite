class User < ApplicationRecord
    has_many :events, through: :attendances
    has_many :attendances

    validates :email, null: false, default: ""
    validates :encrypted_password, null: false, default: ""

    after_create :welcome_send

    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
end
