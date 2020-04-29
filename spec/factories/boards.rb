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

FactoryBot.define do
  factory :board do
    name { 'ソフトドリンク' }
    default_username { '内容量　774ml' }
    description { '◆この板は、アルコール類以外の飲み物に関する話題を扱う板です。' }
    association :category
  end
end
