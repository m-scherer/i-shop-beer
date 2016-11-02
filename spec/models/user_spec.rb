require 'rails_helper'

RSpec.describe User, type: :model do
  context "invalid attributes" do
    it "is invalid without an email" do
      invalid_user = User.new(password: "test")

      expect(invalid_user).to be_invalid
    end
    it "is invalid without a password" do
      invalid_user = User.new(email: "bob@test.com")

      expect(invalid_user).to be_invalid
    end
  end

  context "valid attributes" do
    it "is valid" do
      valid_user = User.new(email: "bob@test.com", password: "pass")

      expect(valid_user).to be_valid
    end
  end

  context "relationships" do
    pending
    end

end
