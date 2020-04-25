# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  it '有効なファクトリを持つこと' do
    expect(category).to be_valid
  end
end
