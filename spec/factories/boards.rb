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

FactoryBot.define do
  factory :board do
    name { '地震速報' }
    default_username { '名無しさん' }
    description { 'なまず' }
    association :category
  end
end
