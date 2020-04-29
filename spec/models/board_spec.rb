# == Schema Information
#
# Table name: boards
#
#  id               :bigint           not null, primary key
#  default_username :string(255)      not null
#  description      :text(65535)
#  name             :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :bigint
#
# Indexes
#
#  index_boards_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { build(:board) }

  it '有効なファクトリを持つこと' do
    expect(board).to be_valid
  end

  it '詳細説明が無くとも有効なこと' do
    board = build(:board, description: nil)
    expect(board).to be_valid
  end

  it '詳細説明が最大文字数より長いときに無効なこと' do
    max_word_count = 500
    board = build(:board, description: 'a' * (max_word_count + 1))
    board.valid?
    expect(board.errors.messages[:description]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'デフォルトユーザ名が最大文字数より長いときに無効なこと' do
    max_word_count = 20
    board = build(:board, default_username: 'a' * (max_word_count + 1))
    board.valid?
    expect(board.errors.messages[:default_username]).to include("は#{max_word_count}文字以内で入力してください")
  end
end
