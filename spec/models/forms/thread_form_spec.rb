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
end
