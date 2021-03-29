require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject { Profile.new(first_name: "test", last_name: "user", age: 12, dob: (Time.now - 3.years),
                        language: "english", sex: "male", phone: "000000000", street: "test street", city: "xyz", state: "xyz", zip: 12345) }
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
