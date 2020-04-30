class SearchablesController < ApplicationController
  def search
    thread_count = 5
    reply_count = 10
    @thres = @search_form.search_threads.page(params[:thres_page]).per(thread_count)
    @replies = @search_form.search_replies.includes(:thre).page(params[:reply_page]).per(reply_count)
  end
end
