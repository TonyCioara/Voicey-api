require 'rails_helper'

RSpec.describe User, type: :model do
    describe "Validation" do
        it "is valid with valid attributes" do
            user = User.new(name: "Eliel", email: "eliel@test.com", password: "password"))
            expect(user).to be_valid
        end

        it "is invalid without a name" do
            bad_user = User.new(name: nil, email: "eliel@test.com", password: "password"))
            expect(bad_user).to_not be_valid
        end

        it "is invalid without an email" do
            bad_user = User.new(name: "Eliel", email: nil, password: "password")
            expect(bad_user).to_not be_valid
        end

        it "is invalid without a password" do
            bad_user = User.new(name: "Eliel", email: "eliel@test.com", password: nil)
            expect(bad_user).to_not be_valid
        end
    end

    describe "Associations" do
        it "should have many memos" do
            assoc = User:reflect_on_associations(:memos)
            expect(assoc.macro).to eq :has_many
        end
    end
end
