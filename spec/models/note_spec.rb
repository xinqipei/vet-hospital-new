require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { Note.new(message: "Message about the profile") }
  describe "Valid" do
    it "is valid with valid attributes" do
      user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user_id: user.id)
      subject.user_id = user.id
      subject.profile_id = profile.id
      expect(subject).to be_valid
    end
  end

  describe "inValid" do
    it "is valid with valid attributes" do
      expect(subject).to_not be_valid
    end
  end
end
