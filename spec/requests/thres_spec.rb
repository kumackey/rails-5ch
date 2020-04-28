require 'rails_helper'

RSpec.describe 'Thres', type: :request do
  it 'スレッド作成画面の取得に成功すること' do
    default_user_name = '内容量　774ml'
    board = create(:board, default_username: default_user_name)
    get "/boards/#{board.id}/thres/new"
    expect(response).to have_http_status(200)
    expect(response.body).to include(default_user_name)
  end

  it '適切な値がparamsに渡っている際にスレッドの作成に成功すること' do
    board = create(:board)
    thread_title = 'ジョージア・マックスコーヒーpart5'
    post "/boards/#{board.id}/thres", params: { thread_form: {
      username: '太郎',
      title: thread_title,
      body: '各種ヲタ御用達の名物ドリンク、ジョージアマックスコーヒーに付いて語ろう。'
    } }
    expect(response).to redirect_to board
    follow_redirect!
    expect(response.body).to include(thread_title)
    expect(response.body).to include('スレを立てました')
  end

  it '不適切な値がparamsに渡っている際にスレッドの作成に失敗すること' do
    board = create(:board)
    post "/boards/#{board.id}/thres", params: { thread_form: {
      username: '太郎',
      title: 'ジョージア・マックスコーヒーpart5',
      body: '' # 本文が無い
    } }
    expect(response).to have_http_status(200)
    expect(response.body).to include('スレを立てるのに失敗しました')
  end
end
