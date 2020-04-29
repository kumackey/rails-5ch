puts 'Start inserting seed "thres" ...'

threads = [
  {
    body: 'rubyの方が楽しくて感覚的で開発速度も早いって聞いて迷ってる',
    title: 'rubyとphpの大きな違いって何？',
    username: '5ちゃんねるからVIPがお送りします',
    board_name: 'Ruby',
    userid: '0123456789',
    useremail: 'sample1@sample.com'
  },
  {
    body: 'Yokohama.rb Monthly Meetup #108
    2020-02-22（土）17:30 - 20:00
    横浜市神奈川地区センター(小会議室)
    神奈川県横浜市神奈川区神奈川本町8-1
    Yokohama.rbは、横浜周辺のRuby技術者たちが集まってRubyに関する何かをする地域Rubyistコミュニティです。

    タイムテーブル
    時間 内容
    17:30～ 開場
    17:40～18:00 自己紹介
    18:00～19:00 セッション1
    19:00～19:10 スイーツタイム
    19:10～20:00 セッション2
    20:00～20:15 片付け',
    title: '日本製プログラミング言語「Ruby」',
    username: '名無し',
    board_name: 'Ruby',
    userid: 'a123456789',
    useremail: 'sample2@sample.com'
  },
  {
    body: '前
    http://tamae.2ch.net/test/read.cgi/php/1409423461/

    ■参考サイト
    <英語>
    本家：http://rubyonrails.org
    API document：http://api.rubyonrails.com/
    開発者のblog：http://weblog.rubyonrails.org/
    参考wiki：http://wiki.rubyonrails.org/rails
    http://ruby-toolbox.com/
    http://rubygems.org/
    http://agilewebdevelopment.com/plugins/top_rated',
    title: '【RoR】Ruby on Rails Part20',
    username: '名無し',
    board_name: 'Ruby',
    userid: 'b123456789'
  },
  {
    body: '一般人のかわいい中学生達を晒して住所特定したりしてるスレがあるので埋めたいです',
    title: '埋め立てスクリプトってRubyで作れますか？',
    username: 'デフォルトの名無しさん',
    board_name: 'Ruby',
    userid: 'c123456789',
    useremail: 'sage'
  },
  {
    body: '意見下さい',
    title: 'SNS作りたいんだけどPHPかRubyどっちがおすすめ？',
    username: '5ちゃんねるからVIPがお送りします',
    board_name: 'Ruby',
    userid: 'd123456789'
  },
  {
    body: '入門書買いたいんだけど
    ・辞書みたいに分厚くない
    ・カラー刷り
    ・Macでの環境構築から解説している
    
    以上に当てはまるおすすめの入門書紹介してください！
    知識はProgateでRubyとRailsのレッスン一周した程度ですw',
    title: 'Ruby on Rails詳しい人来てください',
    username: '5ちゃんねるからVIPがお送りします',
    board_name: 'Ruby',
    userid: '1023456789'
  },
  {
    body: 'プログラミング言語 Rubyについての、初心者向けスレです。質問・要望・雑談などをどうぞ

    質問するときは、OSやRubyのバージョン、エラーメッセージを書いて下さい。
    Ruby on Rails については、WEBプログラミング板で',
    title: 'Ruby 初心者スレッド Part 65',
    username: 'name = nil',
    board_name: 'Ruby',
    userid: '1a23456789'
  }
]

Thre.transaction do
  threads.each do |thread|
    board = Board.find_by(name: thread[:board_name])
    created_thre = board.thres.create!(
      body: thread[:body],
      title: thread[:title],
      username: thread[:username],
      userid: thread[:userid],
      useremail: thread[:useremail]
    )
    puts "#{created_thre.title} has created!"
  end
end
