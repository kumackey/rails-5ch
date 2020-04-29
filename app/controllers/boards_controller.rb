class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
    @thres = @board.thres.includes(:board)
  end
end
