require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: "testuser@example.com", password: "password", first_name: "test", last_name: "user" ) }
  describe "Valid" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is valid with valid attributes without first_name" do
      subject.first_name = nil
      expect(subject).to be_valid
    end

    it "is valid with valid attributes without last_name" do
      subject.last_name = nil
      expect(subject).to be_valid
    end

    it "test of full name method" do
      expect(subject).to be_valid
      subject.full_name.should eq("#{subject.first_name} #{subject.last_name}")
    end
  end

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
