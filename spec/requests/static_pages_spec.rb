require 'rails_helper'

RSpec.describe 'Static_pages', type: :request do
  it 'トップページ画面の取得に成功すること' do
    get '/'
    expect(response).to have_http_status(200)
  end
end
