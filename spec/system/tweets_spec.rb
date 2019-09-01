require 'rails_helper'

RSpec.feature 'Tweets', type: :system, js: true do
  let!(:member) { FactoryBot.create(:member) }
  #   find(".fa-send-o").click
  #   expect{
  #     fill_in "tweet_body", with: "本文テスト"
  #     click_button "投稿する"

  #     expect(page).to have_content '投稿しました。'
  #     expect(page).to have_content '本文テスト'
  #     expect(page).to have_content "#{member.name}"

  #   }.to change(member.tweets, :count).by(1)
  # end
  before {
    visit root_path
    wait_until { page.has_css?("h1", text: "Infomus") }
    click_link 'ログインはこちら'
    fill_in 'member_email', with: member.email
    fill_in 'member_password', with: member.password
    click_button "ログイン"
  }
  scenario ' ユーザーが新しいツイートを作成する ' do
    find(".fa-send-o").click
    expect{
      fill_in "tweet_body", with: "本文テスト"
      click_button "投稿する"

      expect(page).to have_content '投稿しました。'
      expect(page).to have_content '本文テスト'
      expect(page).to have_content "#{member.name}"
    }.to change(member.tweets, :count).by(1)
  end
  # context ' ユーザーが新しいツイートを作成する ' do
  #   it {
  #     fill_in "tweet_body", with: "本文テスト"
  #     click_button "投稿する"
  #     expect(page).to have_content '投稿しました。'
  #     expect(page).to have_content '本文テスト'
  #     expect(page).to have_content "#{member.name}"
  #   }
  #   end
end 