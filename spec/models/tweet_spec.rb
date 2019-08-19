require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet){FactoryBot.build(:tweet)}
  before do
    @blank = "を入力してください"
  end
  example "bodyがなければ無効な状態であること" do
    tweet.body = nil
    tweet.valid?
    expect(tweet.errors[:body]).to include(@blank)
  end
  it "bodyが400文字以上だと無効な状態であること" do
    tweet.body = "hello" * 100
    tweet.valid?
    expect(tweet.errors[:body]).to include("は400文字以内で入力してください")
  end
  # context "画像挿入の場合" do
  #   it "フォームからアップロードされたファイルデータ以外は無効であること" do

  #   end
  #   it "new_imageにjpg,png,gif,bmp以外を入れると無効であること" do
  #     tweet.new_image = "aiueo"
  #     tweet.valid?
  #     expect(tweet.errors[:new_image]).to include()
  #   end
  # end
end
