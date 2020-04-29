class RepliesController < ApplicationController
  def create
    @thre = Thre.find(params[:thre_id])
    @reply_form = ReplyForm.new(reply_form_params.merge(thre_id: @thre.id, ip_address: request.remote_ip))
    if @reply_form.save
      redirect_to @thre, success: 'レスを行いました'
    else
      flash.now[:danger] = 'レスを行うことに失敗しました'
      render 'thres/show'
    end
  end

  private

  def reply_form_params
    params.require(:reply_form)
          .permit(:username, :useremail, :body)
  end
end
