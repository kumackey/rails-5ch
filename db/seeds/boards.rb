puts 'Start inserting seed "boards" ...'

boards = [
  {
    name: 'ニュース速報',
    category: 'ニュース',
    default_username: '番組の途中ですが名無しです',
    description: '速報性・公共性のないスレッド、
    ニュース以外のスレッドは禁止です。'
  },
  {
    name: '科学ニュース',
    category: 'ニュース',
    default_username: '名無しのひみつ'
  },
  {
    name: 'Ruby',
    category: 'プログラミング',
    default_username: 'name = nil',
    description: 'Rubyについての掲示板です。
    Ruby on Railsに関する情報もここで話し合いましょう。'
  },
  {
    name: 'JavaScript',
    category: 'プログラミング',
    default_username: 'NAME IS NULL',
    description: '※Javaに関するスレは別の掲示板で立ててください。'
  },
  {
    name: 'Java',
    category: 'プログラミング',
    default_username: 'null',
    description: '※JavaScriptに関するスレは別の掲示板で立ててください。'
  },
  {
    name: 'クライミング',
    category: 'スポーツ',
    default_username: '無記無記名',
    description: 'インドア・外岩、ボルダリング・リード・スピードのどの話題でもOK！'
  },
  {
    name: '陸上競技',
    category: 'スポーツ',
    default_username: 'ゼッケン７７４さん＠ラストコール'
  },
  {
    name: 'ENGLISH',
    category: '学問',
    default_username: '名無しさん＠英語勉強中',
    description: 'English板は、英語に関する情報交換と学問的な議論の場所です。'
  },
  {
    name: '数学',
    category: '学問',
    default_username: '１３２人目の素数さん'
  },
  {
    name: 'ソフトドリンク',
    category: '食文化',
    default_username: '内容量　774ml',
    description: 'この板は、アルコール類以外の飲み物に関する話題を扱う板です。'
  },
  {
    name: 'インスタント麺',
    category: '食文化',
    default_username: 'すぐ名無し、すごく名無し',
    description: 'インスタントラーメンやカップやきそばなど、
    お湯だけまたは火にかけるだけのように、
    簡単かつ短時間に調理可能なめん類の話題を扱う掲示板です。
    
    ※別途つゆ・具材が必要な製品、麺類以外のインスタント食品などは対象外です。'
  }
]

Board.transaction do
  boards.each do |board|
    category = Category.find_by(name: board[:category])
    created_board = Board.create!(
      name: board[:name],
      default_username: board[:default_username],
      description: board[:description],
      category_id: category.id
    )
    puts "#{created_board.name} has created!"
  end
end
