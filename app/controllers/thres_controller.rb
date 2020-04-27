class ThresController < ApplicationController
  def new
    @thread_form = ThreadForm.new
  end
end
