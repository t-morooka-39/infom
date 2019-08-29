# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  before do
    @member = FactoryBot.create(:member)
    @blank = 'を入力してください'
    @already = 'はすでに存在します'
    @chara_limit = 'は10文字以内で入力してください'
  end
  example 'first_name,last_name,sex,email,passwordがあれば有効な状態であること' do
    expect(@member).to be_valid
  end
  example 'first_nameがなければ無効な状態であること' do
    member = Member.new(first_name: nil)
    member.valid?
    expect(member.errors[:first_name]).to include(@blank)
  end
  example 'last_nameがなければ無効な状態であること' do
    member = Member.new(last_name: nil)
    member.valid?
    expect(member.errors[:last_name]).to include(@blank)
  end
  example 'sexがなければ無効な状態であること' do
    member = Member.new(sex: nil)
    member.valid?
    expect(member.errors[:sex]).to include(@blank)
  end
  example 'emailがなければ無効な状態であること' do
    member = Member.new(email: nil)
    member.valid?
    expect(member.errors[:email]).to include(@blank)
  end
  example '重複したメールアドレスなら無効な状態であること' do
    FactoryBot.create(:member, email: 'test1@example.com')
    member = Member.new(
      first_name: 'あ',
      last_name: 'oao',
      email: 'test1@example.com',
      password: 'hogehogehogehoge',
      sex: 2
    )
    member.valid?
    expect(member.errors[:email]).to include(@already)
  end
  example 'first_nameが10文字を超えたら無効な状態であること' do
    member = Member.new(first_name: 'あいうえおかきくけこさ')
    member.valid?
    expect(member.errors[:first_name]).to include(@chara_limit)
  end
  example 'last_nameが10文字を超えたら無効な状態であること' do
    member = Member.new(last_name: 'あいうえおかきくけこさ')
    member.valid?
    expect(member.errors[:last_name]).to include(@chara_limit)
  end
  example 'sexに３以上を入れたら無効な状態であること' do
    member = Member.new(sex: 3)
    member.valid?
    expect(member.errors[:sex]).to include('は3より小さい値にしてください')
  end
  example ' sexに0を入れたら無効な状態であること ' do
    member = Member.new(sex: 0)
    member.valid?
    expect(member.errors[:sex]).to include('は0より大きい値にしてください')
  end
  example 'passwordが６文字より少なかったら無効であること' do
    member = Member.new(password: 'aiueo')
    member.valid?
    expect(member.errors[:password]).to include('は6文字以上で入力してください')
  end
  example 'introductionが70文字より大きい場合、無効な状態であること' do
    member = FactoryBot.create(:member)
    member.introduction = 'o' * 71
    member.valid?
    expect(member.errors[:introduction]).to include('は70文字以内で入力してください')
  end
end
