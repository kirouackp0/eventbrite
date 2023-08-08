class User < ApplicationRecord
    after_create :welcome_send

    has_many :events, through: :attendances
    has_many :attendances

    validates :email, presence: true
    validates :encrypted_password, presence: true

    private

    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
end
