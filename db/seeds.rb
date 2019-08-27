# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

table_names = %w(members tweets)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end

# Member.create(
#   first_name: "ほげ太",
#   last_name: "ほげ山",
#   email: "hogehoge@hoge.hoge",
#   sex: 1,
#   password: "hogehoge",
#   admin: false
# )