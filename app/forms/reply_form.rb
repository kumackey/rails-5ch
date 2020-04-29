require 'digest/md5'

class ReplyForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :username, :string
  attribute :useremail, :string
  attribute :body, :string
  attribute :thre_id, :integer
  attribute :ip_address, :string

  validates :username, presence: true, length: { maximum: 20 }
  validates :useremail, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :thre_id, presence: true
  validates :ip_address, presence: true

  def save
    if valid?
      @thre = Thre.find(thre_id)
      @reply = @thre.replies.build(
        body: body,
        useremail: useremail,
        userid: generate_userid,
        username: username
      )
      if (@reply = @reply.save)
        @reply
      else
        false
      end
    else
      false
    end
  end

  def generate_userid
    time = Time.current
    origin_stirng = time.day.to_s + time.month.to_s + time.year.to_s + ip_address
    Digest::MD5.hexdigest(origin_stirng).to_s[0..9]
  end
end
