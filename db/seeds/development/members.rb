first_names = %w[太郎 二郎]
last_names = %w[山田 長谷川]
hoges = %w[aiueo kakikukeko]
0.upto(1) do |i|
  Member.create(
    first_name: first_names[i],
    last_name: last_names[i],
    email: "#{hoges[i]}@ho.ge",
    sex: 1,
    password: "hogehoge",
    admin: (i == 0),
    introduction: "こんにちは、私の名前は#{first_names[i]}です。よろしくお願いします。"
  )
end

Member.create(
  first_name: "ほげ太",
  last_name: "ほげ山",
  email: "hogehoge@hoge.hoge",
  sex: 1,
  password: "hogehoge",
  admin: false,
  introduction: "私はテストユーザーです。",
  tester: true
)