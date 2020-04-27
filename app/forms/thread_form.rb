class ThreadForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :username, :string
  attribute :useremail, :string
  attribute :title, :string
  attribute :body, :string

  validates :username, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { maximum: 100 }
end
