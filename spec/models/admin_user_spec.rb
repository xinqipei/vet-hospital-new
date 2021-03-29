require 'rails_helper'
# test admin user when login
RSpec.describe AdminUser, type: :model do
  subject { AdminUser.new(email: "testuser@example.com", password: "password") }
  describe "Valid" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end
# without email and password it is invalid
  describe "Invalid" do

    it "is not valid without valid email" do
      subject.email = "testuser"
      expect(subject).to_not be_valid
    end

    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
