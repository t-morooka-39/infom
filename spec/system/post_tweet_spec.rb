require 'rails_helper'

describe 'Tweets', type: :system, js: true do
  let!(:member) { FactoryBot.create(:member) }
  context ' ログインした時 ' do  
    before do 
      token = member.confirmation_token
      visit member_confirmation_path(confirmation_token: token)
      page.driver.browser.manage.window.resize_to(800,550)
      # expect(page).to have_content 'メールが確認され、登録が完了しました。'
      fill_in 'member_email', with: "#{member.email}"
      fill_in 'member_password', with: "#{member.password}"
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
    end
    it 'ツイートが投稿できること' do
      visit new_tweet_path
      expect(page).to have_content 'ツイート作成'
      fill_in "tweet_body", with: "本文テスト"
      # click_button "投稿する"
      # expect(page).to have_content '投稿しました。'
    end
    # expect(page).to have_content '本文テスト'
    # expect(page).to have_content "#{member.first_name}"
  end

  # it '投稿したツイートにコメントが打てること' do

  #   fill_in 'comment_body', with: 'コメントテスト'
  #   click_button '送信'
  #   expect(page).to have_content 'コメントを投稿しました'
  #   expect(page).to have_content 'コメントテスト'
  #   expect(page).to have_selector 'span', text: "#{member.first_name}"
  # end
end 