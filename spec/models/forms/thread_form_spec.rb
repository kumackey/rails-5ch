require 'rails_helper'

RSpec.describe ThreadForm, type: :model do
  let(:thread_form) { build(:thread_form) }

  it '有効なファクトリを持つこと' do
    expect(thread_form).to be_valid
  end
end
