class ThreadForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :username, :string
  attribute :useremail, :string
  attribute :title, :string
  attribute :body, :string
end
