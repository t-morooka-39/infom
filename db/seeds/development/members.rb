first_names = %w[太郎 二郎 ほげ蔵]
last_names = %w[山田 長谷川 ほげ田]
hoges = %w[aiueo kakikukeko hoge]
0.upto(2) do |i|
  Member.create(
    first_name: first_names[i],
    last_name: last_names[i],
    email: "#{hoges[i]}@ho.ge",
    sex: 1,
    password: "hogehoge",
    admin: (i == 0)
  )
end