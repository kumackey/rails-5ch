# == Schema Information
#
# Table name: thres
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)      not null
#  useremail  :string(255)
#  userid     :string(255)      not null
#  username   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#
# Indexes
#
#  index_thres_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#

require 'rails_helper'

RSpec.describe Thre, type: :model do
  let(:thre) { build(:thre) }

  it '有効なファクトリを持つこと' do
    expect(thre).to be_valid
  end
end
