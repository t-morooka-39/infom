# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { FactoryBot.build(:tweet) }
  before do
    @blank = 'を入力してください'
  end
  it 'bodyが400文字以上だと無効な状態であること' do
    tweet.body = 'hello' * 100
    tweet.valid?
    expect(tweet.errors[:body]).to include('は400文字以内で入力してください')
  end
  example 'bodyがなければ無効な状態であること' do
    tweet.body = nil
    tweet.valid?
    expect(tweet.errors[:body]).to include(@blank)
  end
end
