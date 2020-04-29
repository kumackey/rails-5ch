class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :set_categories_and_boards

  def set_categories_and_boards
    @categories = Category.joins(:boards).eager_load(:boards)
  end
end
