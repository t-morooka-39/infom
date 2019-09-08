require 'rails_helper'

describe 'フォロー機能', type: :system, js: true do
  let!(:member_a) { FactoryBot.create(:member)}
  let!(:member_b) { FactoryBot.create(:member)}
  before do
    token = member_a.confirmation_token
    visit member_confirmation_path(confirmation_token: token)
    # page.driver.browser.manage.window.resize_to(800,550)
    fill_in 'member_email', with: "#{member_a.email}"
    fill_in 'member_password', with: "#{member_a.password}"
    click_button 'ログイン'
    visit "/members/#{ member_b.id} "
  end
  context 'メンバーbをフォローしていない時' do
    it 'フォローボタンが表示され、クリックするとフォローできること' do
      expect(page).to have_content 'フォロー'
      click_button 'フォロー'
      expect(page).to have_content 'フォロー解除'
    end
  end
end