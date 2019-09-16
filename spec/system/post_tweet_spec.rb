# frozen_string_literal: true

require 'rails_helper'

describe 'Tweets', type: :system, js: true do
  let!(:member) { FactoryBot.create(:member) }
  context ' ログインした時 ' do
    before do
      token = member.confirmation_token
      visit member_confirmation_path(confirmation_token: token)
      # expect(page).to have_content 'メールが確認され、登録が完了しました。'
      fill_in 'member_email', with: member.email.to_s
      fill_in 'member_password', with: member.password.to_s
      click_button 'ログイン'
      visit new_tweet_path
    end
    it 'ツイートが投稿できること' do
      fill_in 'tweet_body', with: '本文テスト'
      click_button '投稿する'
      expect(page).to have_content '投稿しました。'
      expect(page).to have_content '本文テスト'
      expect(page).to have_content member.first_name.to_s
    end
    it '投稿したツイートにコメントできること' do
      fill_in 'tweet_body', with: '本文テスト'
      click_button '投稿する'
      fill_in 'comment_body', with: 'コメントテスト'
      click_button '送信'
      expect(page).to have_content 'コメントを投稿しました'
      expect(page).to have_content 'コメントテスト'
      expect(page).to have_selector 'span', text: member.first_name.to_s
    end
  end
end
