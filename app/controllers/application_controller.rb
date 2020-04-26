class ApplicationController < ActionController::Base
  before_action :set_categories_and_boards

  def set_categories_and_boards
    @categories = Category.joins(:boards).eager_load(:boards)
  end
end
