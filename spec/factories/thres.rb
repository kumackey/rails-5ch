# == Schema Information
#
# Table name: thres
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)      not null
#  useremail  :string(255)
#  userid     :string(255)      not null
#  username   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#
# Indexes
#
#  index_thres_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#

FactoryBot.define do
  factory :thre do
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
    userid { 'exRDfqAf' }
    username { '内容量　774ml' }
    association :board
  end
end
