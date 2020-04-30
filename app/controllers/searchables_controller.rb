class SearchablesController < ApplicationController
  def search
    @thres = @search_form.search_threads
    @replies = @search_form.search_replies.includes(:thre)
  end
end
