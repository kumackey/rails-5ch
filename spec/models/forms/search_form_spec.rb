require 'rails_helper'

RSpec.describe SearchForm, type: :model do
  it 'スレッドのタイトルを検索できること' do
    thread_title = 'コーラの美味しさについて語る'
    create(:thre, title: thread_title)
    search_form = SearchForm.new(keyword: thread_title)
    thre = search_form.search_threads.take
    expect(thre.title).to eq thread_title
  end

  it 'スレッドの本文を検索できること' do
    part_of_thread_body = 'ペプシ派もコカコーラ派も仲良くしましょう！'
    thread_body = "コーラの美味しさについて語りあいましょう！
    #{part_of_thread_body}
    ちなみに私はコカコーラ派です！！"
    create(:thre, body: thread_body)
    search_form = SearchForm.new(keyword: part_of_thread_body)
    thre = search_form.search_threads.take
    expect(thre.body).to eq thread_body
  end

  it '無意味な文字では検索結果が出ないこと' do
    keyword = 'HEYjvvCAYaHKJ.AkTt&k'
    create(:thre)
    search_form = SearchForm.new(keyword: keyword)
    expect(search_form.search_threads).to be_empty
  end
end
