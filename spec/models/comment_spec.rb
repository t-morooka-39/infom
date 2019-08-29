# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.build(:comment) }
  before do
    @blank = 'を入力してください'
  end
  example 'bodyが無ければ無効であること' do
    comment.body = nil
    comment.valid?
    expect(comment.errors[:body]).to include(@blank)
  end
  example 'bodyが200文字を超えた場合無効であること' do
    comment.body = 'a' * 201
    comment.valid?
    expect(comment.errors[:body]).to include('は200文字以内で入力してください')
  end 
end
