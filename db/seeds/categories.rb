puts 'Start inserting seed "categories" ...'

category_names = %w[プログラミング ニュース スポーツ 学問 食文化]
categories = category_names.map { |category_name| { name: category_name } }

Category.transaction do
  categories.each do |category|
    created_category = Category.create!(name: category[:name])
    puts "#{created_category.name} has created!"
  end
end
