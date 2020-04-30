class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string

  def search_threads
    Thre.none if keyword.blank?
    Thre.body_or_title_contain(keyword)
  end

  def search_replies
    Reply.none if keyword.blank?
    Reply.body_contain(keyword)
  end
end
