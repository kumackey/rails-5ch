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

  it 'タイトルが無いときに無効なこと' do
    thre = build(:thre, title: nil)
    expect(thre).not_to be_valid
  end

  it 'タイトルが最大文字数より長いときに無効なこと' do
    max_word_count = 100
    thre = build(:thre, title: 'a' * (max_word_count + 1))
    thre.valid?
    expect(thre.errors.messages[:title]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'ユーザの名前が最大文字数より長いときに無効なこと' do
    max_word_count = 20
    thre = build(:thre, username: 'a' * (max_word_count + 1))
    thre.valid?
    expect(thre.errors.messages[:username]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'Eメールが最大文字数より長いときに無効なこと' do
    max_word_count = 255
    thre = build(:thre, useremail: 'a' * (max_word_count + 1))
    thre.valid?
    expect(thre.errors.messages[:useremail]).to include("は#{max_word_count}文字以内で入力してください")
  end

  describe 'ユーザIDが' do
    user_id_word_count = 10
    context "#{user_id_word_count - 1}文字のときに" do
      let(:thre) { build(:thre, userid: 'a' * (user_id_word_count - 1)) }
      it '無効なこと' do
        thre.valid?
        expect(thre.errors[:userid]).to include("は#{user_id_word_count}文字以上で入力してください")
      end
    end
    context "#{user_id_word_count + 1}文字のときに" do
      let(:thre) { build(:thre, userid: 'a' * (user_id_word_count + 1)) }
      it '無効なこと' do
        thre.valid?
        expect(thre.errors[:userid]).to include("は#{user_id_word_count}文字以内で入力してください")
      end
    end
    context "#{user_id_word_count}文字のときに" do
      let(:thre) { build(:thre, userid: 'a' * user_id_word_count) }
      it '有効なこと' do
        expect(thre).to be_valid
      end
    end
    context '大文字英字を含むときに' do
      let(:thre) { build(:thre, userid: 'A' * user_id_word_count) }
      it '無効なこと' do
        thre.valid?
        expect(thre.errors[:userid]).to include('は不正な値です')
      end
    end
    context '存在しないときに' do
      let(:thre) { build(:thre, userid: nil) }
      it '無効なこと' do
        thre.valid?
        expect(thre.errors[:userid]).to include('は不正な値です')
      end
    end
  end
end
