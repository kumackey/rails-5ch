# == Schema Information
#
# Table name: boards
#
#  id               :bigint           not null, primary key
#  default_username :string(255)      not null
#  description      :string(255)
#  name             :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :bigint
#
# Indexes
#
#  index_boards_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { build(:board) }

  it '有効なファクトリを持つこと' do
    expect(board).to be_valid
  end
end
