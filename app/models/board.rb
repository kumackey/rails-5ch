# == Schema Information
#
# Table name: boards
#
#  id               :bigint           not null, primary key
#  default_username :string(255)      not null
#  description      :text(65535)
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

class Board < ApplicationRecord
  belongs_to :category
end
