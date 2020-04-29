# == Schema Information
#
# Table name: replies
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  useremail  :string(255)
#  userid     :string(255)      not null
#  username   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  thre_id    :bigint
#
# Indexes
#
#  index_replies_on_thre_id  (thre_id)
#
# Foreign Keys
#
#  fk_rails_...  (thre_id => thres.id)
#

class Reply < ApplicationRecord
end
