first_names = %w[太郎 二郎]
last_names = %w[山田 長谷川]
hoges = %w[hoge hogehoge]
0.upto(1) do |i|
  Member.create(
    first_name: first_names[i],
    last_names: last_names[i],
    email: "#{hoges[i]}@gmail.com",
    sex: 1,
    password: "hogehoge"
    admin: (i == 0)
  )
end