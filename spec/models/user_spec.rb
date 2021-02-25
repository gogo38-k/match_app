require 'rails_helper'

RSpec.describe User, type: :model do
	describe '#create' do


	it "登録には名前、メールアドレス、パスワードが必要" do
		user = build(:user)
	  	expect(user).to be_valid
	end

	it "nameがないと登録できない" do
		user = build(:user, name: nil)
		user.valid?
		expect(user.errors[:name]).to include("can't be blank")
	end


end
