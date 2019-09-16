# frozen_string_literal: true

require 'rails_helper'
describe 'いいね機能', type: :system, js: true do
  let!(:member_a) { FactoryBot.create(:member) }
  let!(:member_b) { FactoryBot.create(:member) }
  let!(:tweet_a) { FactoryBot.create(:tweet, member_id: member_a.id) }
  let!(:tweet_b) { FactoryBot.create(:tweet, member_id: member_b.id) }
  before do
    token = member_a.confirmation_token
    visit member_confirmation_path(confirmation_token: token)
    fill_in 'member_email', with: member_a.email.to_s
    fill_in 'member_password', with: member_a.password.to_s
    click_button 'ログイン'
  end
  context ' ツイートが自分のものではないとき ' do
    before do
      visit "/tweets/#{tweet_b.id} "
    end
    context 'いいねボタンを押していないとき' do
      it 'いいねボタンを押せること' do
        expect(page).to have_css '.fa-heart-o'
        first('.likebtn').click
        expect(page).to have_css '.fa-heart'
      end
    end
    context 'いいねボタンを押しているとき' do
      before do
        first('.likebtn').click
      end
      it 'いいねの解除ができること' do
        expect(page).to have_css '.fa-heart'
        first('.likebtn').click
        expect(page).to have_css '.fa-heart-o'
      end
    end
  end
  context 'ツイートが自分のもののとき' do
    before do
      visit "/tweets/#{tweet_a.id}"
    end
    it 'いいねボタンが表示されないこと' do
      expect(page).not_to have_css '.likebtn'
    end
  end
end
