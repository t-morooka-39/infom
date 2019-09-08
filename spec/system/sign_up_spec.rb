require 'rails_helper'

RSpec.describe 'sign up', type: :system, js: true do
  background do
    ActionMailer::Base.deliveries.clear
  end

  it '必要情報を入力し、メールでの認証を完了する' do
    visit root_path
    page.driver.browser.manage.window.resize_to(1440,900)
    page.first(".sign_up").click

    fill_in 'member_last_name', with: "たろう"
    fill_in 'member_first_name', with: "やまだ"
    choose 'member_sex_1'
    fill_in 'member_email', with: "hoge1@ho.ge"
    fill_in 'member_password', with: "hogehoge"
    fill_in 'member_password_confirmation', with: "hogehoge"
    expect {click_button '登録用メールを送信'}.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content '確認メールを登録したメールアドレス宛に送信しました。'

    member = Member.last
    token = member.confirmation_token
    visit member_confirmation_path(confirmation_token: token)
    expect(page).to have_content 'メールが確認され、登録が完了しました。'
  end
end