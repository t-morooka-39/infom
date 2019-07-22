require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      name: "佐藤太郎",
      nickname: "satotaro",
      email: "sato@gmail.com",
      birthday: "1997-07-07",
    )
  end

  example "nameがなければ無効であること" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  example "emailがなければ無効であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  example "birthdayがなければ無効であること" do
    user = User.new(birthday: nil)
    user.valid?
    expect(user.errors[:birthday]).to include("can't be blank")
  end
  example "nicknameがなければ無効であること" do
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  example "重複したnicknameなら無効な状態であること" do
    user = User.new(
      name: "太呂山さとる",
      nickname: "satotaro",
      email: "take@gmail.com",
      birthday: "1997-09-09",
    )
    user.valid?
    expect(user.errors[:nickname]).to include("has already been taken")
  end

end
