# == Schema Information
#
# Table name: thres
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
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

require 'rails_helper'

RSpec.describe Thre, type: :model do
  let(:thre) { build(:thre) }

  it '有効なファクトリを持つこと' do
    expect(thre).to be_valid
  end

  it '本文が最大文字数より長いときに無効なこと' do
    max_word_count = 500
    thre = build(:thre, body: 'a' * (max_word_count + 1))
    thre.valid?
    expect(thre.errors.messages[:body]).to include("は#{max_word_count}文字以内で入力してください")
  end
end
