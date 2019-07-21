nicknames = %w[Taro Jiro Saburo]
names = %w[山田太郎 長谷川二郎 谷口三郎]

0.upto(2) do |i|
  User.create(
    nickname: nicknames[i],
    name: names[i],
    email: "#{nicknames[i]}@example.com",
    birthday: "1996-12-12",
    sex: 1,
    admin: (i == 0)
  )
end