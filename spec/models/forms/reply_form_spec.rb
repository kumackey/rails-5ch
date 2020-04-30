require 'rails_helper'

RSpec.describe ReplyForm, type: :model do
  let(:reply_form) { build(:reply_form) }

  it '有効なファクトリを持つこと' do
    expect(reply_form).to be_valid
  end

  it '本文が無いときに無効なこと' do
    reply_form = build(:reply_form, body: '')
    reply_form.valid?
    expect(reply_form.errors.messages[:body]).to include('を入力してください')
  end

  it '本文が最大文字数より長いときに無効なこと' do
    max_word_count = 500
    reply_form = build(:reply_form, body: 'a' * (max_word_count + 1))
    reply_form.valid?
    expect(reply_form.errors.messages[:body]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'ユーザー名が最大文字数より長いときに無効なこと' do
    max_word_count = 20
    reply_form = build(:reply_form, username: 'a' * (max_word_count + 1))
    reply_form.valid?
    expect(reply_form.errors.messages[:username]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'Eメールが最大文字数より長いときに無効なこと' do
    max_word_count = 255
    reply_form = build(:reply_form, useremail: 'a' * (max_word_count + 1))
    reply_form.valid?
    expect(reply_form.errors.messages[:useremail]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'IPアドレスが無いときに無効なこと' do
    reply_form = build(:reply_form, ip_address: nil)
    reply_form.valid?
    expect(reply_form.errors.messages[:ip_address]).to include('を入力してください')
  end

  it '掲示板に関する情報を持っていないときに無効なこと' do
    reply_form = build(:reply_form, thre_id: nil)
    reply_form.valid?
    expect(reply_form.errors.messages[:thre_id]).to include('を入力してください')
  end

  it '異なるIPアドレスからは異なるユーザIDを生成できること' do
    reply_form = build(:reply_form, ip_address: '192.168.0.1')
    other_reply_form = build(:reply_form, ip_address: '192.168.0.2')
    expect(reply_form.generate_userid).not_to eq other_reply_form.generate_userid
  end

  it '期待する文字数のユーザIDを生成できること' do
    word_count = 10
    reply_form = build(:reply_form)
    expect(reply_form.generate_userid.size).to eq word_count
  end
end
