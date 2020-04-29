class SearchablesController < ApplicationController
  def search
    @thres = @search_form.search_threads
  end
end
