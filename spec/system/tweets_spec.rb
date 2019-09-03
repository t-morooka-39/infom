require 'rails_helper'

RSpec.feature 'Tweets', type: :system, js: true do
  let!(:member) { FactoryBot.create(:member) }

  before {
    token = member.confirmation_token
    visit member_confirmation_path(confirmation_token: token)
    fill_in 'member_email', with: member.email
    fill_in 'member_password', with: member.password
    click_button "ログイン"
  }
  it ' ユーザーが新しいツイートを作成すること ' do  
    # click_link(class: 'post_tweet')
    find(".fa-send-o").click
    fill_in "tweet_body", with: "本文テスト"
    click_button "投稿する"

    expect(page).to have_content '投稿しました。'
    expect(page).to have_content '本文テスト'
    expect(page).to have_content "#{member.name}"  
  end
end 