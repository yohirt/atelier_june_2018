require "rails_helper"

RSpec.describe User, type: :model do
  context "validation test" do
    it "ensures first name presence" do
      user = User.new(email: "rspec").save
      expect(user).to eq(false)
    end

    it "ensures first name presence" do
      user = User.new(email: "rspec", encrypted_password: "rspec", sign_in_count: 2).save
      expect(user).to eq(false)
    end

    # context "scope test" do
    #   let (:params) { {email: "rspec", encrypted_password: "rspec", sign_in_count: 0} }
    #   before(:each) do
    #     user = User.new(params.(timestamps: "jakas data")).save
    #     user = User.new(params.merge(timestamps)).save
    #     user = User.new(params.merge(timestamps)).save
    #     user = User.new(params.merge(timestamps)).save
    #   end
    #   it "should return active users" do
    #     expect(User.jakisscope.size).to eq(3)
    #   end
    # end
  end
end
