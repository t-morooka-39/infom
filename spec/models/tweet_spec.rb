require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @blank = "を入力してください"
  end
  example "bodyがなければ無効な状態であること" do
    tweet = FactoryBot.build(:tweet, body: nil)
    tweet.valid?
    expect(tweet.errors[:body]).to include(@blank)
  end
end
