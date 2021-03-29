require 'rails_helper'
# test for making an appointment
RSpec.describe Appointment, type: :model do
  subject { Appointment.new(date: Time.now, time: Time.now) }
# if has profile, pet, user_id, 
  describe "Valid" do
    it "is valid with valid attributes" do
      user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user_id: user.id)
      pet = FactoryBot.create(:pet, user_id: user.id )
      subject.profile_id = profile.id
      subject.pet_id = pet.id
      expect(subject).to be_valid
    end
  end
  describe "inValid" do
    it "is invalid with invalid attributes" do
      expect(subject).to_not be_valid
    end
  end
end
