FactoryBot.define do
  factory :thread_form do
    body do
      'ここは新しい飲料の感想をﾏﾀｰﾘ語り合うスレです。\n
      購入地域、店舗などの情報もお待ちしております。\n
      皆で情報を共有していきましょう！\n
      ・「この情報を知りたい！でもその前に・・・」\n
      貴方の欲しい情報は、数日前の書き込みにあったりします。\n
      せめて30番位前からの過去レスも読むようにしましょう！\n
      ●●●新商品の飲料を語るスレVol.37●●●\n
      http://matsuri.5ch.net/test/read.cgi/juice/1564480143/'
    end
    title { '●●●新商品の飲料を語るスレVol.38●●●' }
    useremail { 'sage' }
    username { '内容量　774ml' }
  end
end
