module ApplicationHelper
  def active_in_sidebar(board_id)
    'active' if controller.controller_name == 'boards' && board_id == params[:id].to_i
  end
end
