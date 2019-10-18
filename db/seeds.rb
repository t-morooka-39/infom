# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# table_names = %w(members tweets)
# table_names.each do |table_name|
#   path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
#   if File.exist?(path)
#     puts "Creating #{table_name}..."
#     require path
#   end
# end

Member.create(
  first_name: "太郎",
  last_name: "山田",
  email: Rails.application.credentials.dig(:mail, :gmail),
  sex: 1,
  password: "morooka",
  admin: true,
  introduction: "こんにちは、私の名前は太郎です。よろしくお願いします。",
)

Member.create(
  first_name: "ほげ太",
  last_name: "ほげ山",
  email: Rails.application.credentials.dig(:mail, :yahoo),
  sex: 1,
  password: "hogehoge",
  admin: false,
  introduction: "私はテストユーザーです。",
  tester: true,
)

body = 
  "吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。\n" +
  "吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。この書生というのは時々我々を捕えて煮て食うという話である。\n"

name = "太郎"
member = Member.find_by(first_name: name)
0.upto(5) do |i|
  Tweet.create(
    author: member,
    body: body,
  )
end