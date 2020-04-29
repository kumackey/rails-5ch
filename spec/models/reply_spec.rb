# == Schema Information
#
# Table name: replies
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  useremail  :string(255)
#  userid     :string(255)      not null
#  username   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  thre_id    :bigint
#
# Indexes
#
#  index_replies_on_thre_id  (thre_id)
#
# Foreign Keys
#
#  fk_rails_...  (thre_id => thres.id)
#

require 'rails_helper'

RSpec.describe Reply, type: :model do
  let(:reply) { build(:reply) }

  it '有効なファクトリを持つこと' do
    expect(reply).to be_valid
  end

  it '本文が最大文字数より長いときに無効なこと' do
    max_word_count = 500
    reply = build(:reply, body: 'a' * (max_word_count + 1))
    reply.valid?
    expect(reply.errors.messages[:body]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'ユーザの名前が最大文字数より長いときに無効なこと' do
    max_word_count = 20
    reply = build(:reply, username: 'a' * (max_word_count + 1))
    reply.valid?
    expect(reply.errors.messages[:username]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'Eメールが最大文字数より長いときに無効なこと' do
    max_word_count = 255
    reply = build(:reply, useremail: 'a' * (max_word_count + 1))
    reply.valid?
    expect(reply.errors.messages[:useremail]).to include("は#{max_word_count}文字以内で入力してください")
  end

  describe 'ユーザIDが' do
    user_id_word_count = 10
    context "#{user_id_word_count - 1}文字のときに" do
      let(:reply) { build(:reply, userid: 'a' * (user_id_word_count - 1)) }
      it '無効なこと' do
        reply.valid?
        expect(reply.errors[:userid]).to include("は#{user_id_word_count}文字以上で入力してください")
      end
    end
    context "#{user_id_word_count + 1}文字のときに" do
      let(:reply) { build(:reply, userid: 'a' * (user_id_word_count + 1)) }
      it '無効なこと' do
        reply.valid?
        expect(reply.errors[:userid]).to include("は#{user_id_word_count}文字以内で入力してください")
      end
    end
    context "#{user_id_word_count}文字のときに" do
      let(:reply) { build(:reply, userid: 'a' * user_id_word_count) }
      it '有効なこと' do
        expect(reply).to be_valid
      end
    end
    context '大文字英字を含むときに' do
      let(:reply) { build(:reply, userid: 'A' * user_id_word_count) }
      it '無効なこと' do
        reply.valid?
        expect(reply.errors[:userid]).to include('は不正な値です')
      end
    end
    context '存在しないときに' do
      let(:reply) { build(:reply, userid: nil) }
      it '無効なこと' do
        reply.valid?
        expect(reply.errors[:userid]).to include('は不正な値です')
      end
    end
  end
end
