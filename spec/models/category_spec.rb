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
end
