require 'rails_helper'

RSpec.describe ThreadForm, type: :model do
  let(:thread_form) { build(:thread_form) }

  it '有効なファクトリを持つこと' do
    expect(thread_form).to be_valid
  end

  it '本文が無いときに無効なこと' do
    thread_form = build(:thread_form, body: '')
    thread_form.valid?
    expect(thread_form.errors.messages[:body]).to include('を入力してください')
  end

  it '本文が最大文字数より長いときに無効なこと' do
    max_word_count = 500
    thread_form = build(:thread_form, body: 'a' * (max_word_count + 1))
    thread_form.valid?
    expect(thread_form.errors.messages[:body]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'ユーザー名が最大文字数より長いときに無効なこと' do
    max_word_count = 20
    thread_form = build(:thread_form, username: 'a' * (max_word_count + 1))
    thread_form.valid?
    expect(thread_form.errors.messages[:username]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'スレッドタイトルが最大文字数より長いときに無効なこと' do
    max_word_count = 100
    thread_form = build(:thread_form, title: 'a' * (max_word_count + 1))
    thread_form.valid?
    expect(thread_form.errors.messages[:title]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'Eメールが最大文字数より長いときに無効なこと' do
    max_word_count = 255
    thread_form = build(:thread_form, useremail: 'a' * (max_word_count + 1))
    thread_form.valid?
    expect(thread_form.errors.messages[:useremail]).to include("は#{max_word_count}文字以内で入力してください")
  end

  it 'IPアドレスが無いときに無効なこと' do
    thread_form = build(:thread_form, ip_address: nil)
    thread_form.valid?
    expect(thread_form.errors.messages[:ip_address]).to include('を入力してください')
  end

  it '掲示板に関する情報を持っていないときに無効なこと' do
    thread_form = build(:thread_form, board_id: nil)
    thread_form.valid?
    expect(thread_form.errors.messages[:board_id]).to include('を入力してください')
  end

  it '異なるIPアドレスからは異なるユーザIDを生成できること' do
    thread_form = build(:thread_form, ip_address: '192.168.0.1')
    other_thread_form = build(:thread_form, ip_address: '192.168.0.2')
    expect(thread_form.generate_userid).not_to eq other_thread_form.generate_userid
  end

  it '期待する文字数のユーザIDを生成できること' do
    word_count = 10
    thread_form = build(:thread_form)
    expect(thread_form.generate_userid.size).to eq word_count
  end

  it '有効なファクトリならばスレッドを立てられること' do
    board = create(:board)
    thread_form = build(:thread_form, board_id: board.id)
    expect { thread_form.save }.to change { Thre.count }.by(1)
  end

  it '無効なファクトリであればスレッドを立てられないこと' do
    board = create(:board)
    thread_form = build(:thread_form, board_id: board.id, username: nil)
    expect { thread_form.save }.to change { Thre.count }.by(0)
  end
end
