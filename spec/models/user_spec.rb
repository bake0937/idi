require 'spec_helper'

RSpec.describe User, :type => :model do
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください。")
  end
end
