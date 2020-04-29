require 'rails_helper'

RSpec.describe 'Replies', type: :request do
  it '適切な値がparamsに渡っている際にレスの作成に成功すること' do
    thre = create(:thre)
    reply_body = 'ジョージア・マックスコーヒーpart5'
    post "/thres/#{thre.id}/replies", params: { reply_form: {
      username: '太郎',
      body: reply_body
    } }
    expect(response).to redirect_to thre
    follow_redirect!
    expect(response.body).to include(reply_body)
    expect(response.body).to include('レスを行いました')
  end

  it '不適切な値がparamsに渡っている際にレスの作成に失敗すること' do
    thre = create(:thre)
    post "/thres/#{thre.id}/replies", params: { reply_form: {
      username: '太郎',
      body: '' # 本文が無い
    } }
    expect(response).to have_http_status(200)
    expect(response.body).to include('レスを行うことに失敗しました')
  end
end
