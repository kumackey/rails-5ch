class BoardsController < ApplicationController
  def show
    thread_count = 5
    @board = Board.find(params[:id])
    @thres = @board.thres.includes(:board).page(params[:page]).per(thread_count)
  end
end
