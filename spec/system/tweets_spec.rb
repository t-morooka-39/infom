require 'rails_helper'

RSpec.feature 'Tweets', type: :system, js: true do
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
    member = FactoryBot.create(:member)
    login_as(member, scope: :member, :run_callbacks => false)
    visit root_path
    wait_until { page.has_css?("h1", text: "Infomus") }
  }
  scenario ' ユーザーが新しいツイートを作成する ' do
    click_link(class: 'post_tweet')
    wait_until { page.has_css?("h1", text: "ツイート作成") }
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