class Profile < ApplicationRecord
    before_create :remove_profiles

    has_many :appointments, dependent: :destroy
    has_many :pets, through: :appointments


    has_many :notes, dependent: :destroy
    # has_many :users, through: :notes

    belongs_to :user



    def remove_profiles
        if Profile.find_by(user_id: self.user_id).present?
            Profile.destroy_all
        end
    end
end
