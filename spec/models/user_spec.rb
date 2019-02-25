require 'rails_helper'

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であるべき
	it "is valid with a first name last name, email, and password" do
		user = User.new(
			first_name: "ichiro",
			last_name: "suzuki",
			email: "test@example.com",
			password: "password"
		)
		expect(user).to be_valid
	end

	# 名がなければ無効な状態であるべき
	it "is invalid without a first name" do
		user = User.new(first_name: nil)
		user.valid?
		expect(user.errors[:first_name]).to include("can't be blank")
	end

	# 性がなければ無効な状態であるべき
	it "is invalid without a last name" do
		user = User.new(last_name: nil)
		user.valid?
		expect(user.errors[:last_name]).to include("can't be blank")
	end

	# メールアドレスがなければ無効な状態であるべき
	it "is invalid without an email" do
		User.create(
			first_name: "Joe",
			last_name:  "Tester",
			email:      "tester@example.com",
			password:   "password",
		)
		user = User.new(
			first_name: "Jane",
			last_name:  "Tester",
			email:      "tester@example.com",
			password:   "password",
		)
		user.valid?
		expect(user.errors[:email]).to include("has already been taken")
	end

	# 重複したメールアドレスなら無効な状態であるべき
	it "is invalid duplicate email"
  # ユーザーのフルネームを文字列として返すべき
	it "returns a user's full name as a string"

	it "returns a user's full name as a string" do
		user = User.new(
			first_name: "John",
			last_name: "Doe",
			email: "johndoe@example.com",
		)
		expect(user.name).to eq "John Doe"
	end
end
