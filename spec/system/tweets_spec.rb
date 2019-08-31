require 'rails_helper'

RSpec.feature 'Tweets', type: :system do
  scenario ' ユーザーが新しいツイートを作成する ' do
    member = FactoryBot.create(:member)
    visit root_path
    find(".fa-sign-in").click
    fill_in 'member_email', with: member.email
    fill_in 'member_password', with: member.password
    click_button "ログイン"

    find(".fa-send-o").click
    expect{
      fill_in "tweet_body", with: "本文テスト"
      click_button "投稿する"

      expect(page).to have_content '投稿しました。'
      expect(page).to have_content '本文テスト'
      expect(page).to have_content "#{member.name}"

    }.to change(member.tweets, :count).by(1)
  end
end 