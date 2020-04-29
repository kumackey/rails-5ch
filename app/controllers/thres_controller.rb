class ThresController < ApplicationController
  def new
    @board = Board.find(params[:board_id])
    @thread_form = ThreadForm.new(username: @board.default_username)
  end

  def create
    @board = Board.find(params[:board_id])
    @thread_form = ThreadForm.new(thread_form_params.merge(board_id: @board.id, ip_address: request.remote_ip))
    if @thread_form.save
      redirect_to @board, success: 'スレを立てました'
    else
      flash.now[:danger] = 'スレを立てるのに失敗しました'
      render :new
    end
  end

  def show
    @thre = Thre.find(params[:id])
    @reply_form = ReplyForm.new(username: @thre.board.default_username)
    @replies = @thre.replies.includes(:thre)
  end

  private

  def thread_form_params
    params.require(:thread_form)
          .permit(:username, :useremail, :title, :body)
  end
end
