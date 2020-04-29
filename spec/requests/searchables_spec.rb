require 'rails_helper'

RSpec.describe 'Static_pages', type: :request do
  it '検索画面の取得に成功すること' do
    get '/search'
    expect(response).to have_http_status(200)
  end
end
