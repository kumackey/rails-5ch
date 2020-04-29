# == Schema Information
#
# Table name: thres
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
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

class Thre < ApplicationRecord
  belongs_to :board
  has_many :replies, dependent: :destroy

  validates :body, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :useremail, length: { maximum: 255 }
  validates :username, presence: true, length: { maximum: 20 }
  VALID_USER_ID_REGEX = /\A[a-z0-9]+\z/.freeze
  validates :userid, presence: true,
                     length: { maximum: 10, minimum: 10 },
                     format: { with: VALID_USER_ID_REGEX }
end
