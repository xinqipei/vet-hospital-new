require 'rails_helper'

RSpec.describe Pet, type: :model do
  subject { Pet.new(name: "test", age: 12, medical_history: "xyz", phone: "00000000000") }
  describe "Valid" do
    it "is valid with valid attributes" do
      user = User.create(email: "testuser@example.com", password: "password", first_name: "test", last_name: "user" )
      subject.user_id = user.id
      expect(subject).to be_valid
    end
  end
  describe "inValid" do
    it "is valid with valid attributes" do
      expect(subject).to_not be_valid
    end
  end
end
