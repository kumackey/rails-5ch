class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :set_categories_and_boards
  before_action :set_search_form

  def set_categories_and_boards
    @categories = Category.joins(:boards).eager_load(:boards)
  end

  def set_search_form
    @search_form = SearchForm.new(search_params)
  end

  private

  def search_params
    params.fetch(:q, {}).permit(:keyword)
  end
end
