# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  it '有効なファクトリを持つこと' do
    expect(category).to be_valid
  end

  it 'カテゴリー名が空白であるときに無効なこと' do
    category.name = ''
    category.valid?
    expect(category.errors.messages[:name]).to include('を入力してください')
  end

  it 'カテゴリー名が最大文字数より長いときに無効なこと' do
    max_word_count = 255
    category.name = 'a' * (max_word_count + 1)
    category.valid?
    expect(category.errors.messages[:name]).to include("は#{max_word_count}文字以内で入力してください")
  end
end
