require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  it '掲示板詳細画面の取得に成功すること' do
    board_name = 'ニュース速報'
    board = create(:board, name: board_name)
    get "/boards/#{board.id}"
    expect(response).to have_http_status(200)
    expect(response.body).to include(board_name)
  end
end
