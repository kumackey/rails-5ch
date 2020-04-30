class StaticPagesController < ApplicationController
  def top
    @thre = Thre.order(updated_at: :desc).limit(1).take
    @reply = Reply.order(updated_at: :desc).limit(1).take
  end
end
