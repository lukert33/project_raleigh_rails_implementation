class PagesController < ApplicationController
  def show
    @current_page = Page.find(params[:id])
    @next_page = @current_page.next_page
    @prev_page = current_user.prev_read_page(@current_page)
  end

  def update
    read_page = UserPage.find_or_create_by(user_id: current_user.id, page_id: params[:id])
    redirect_to page_path(read_page.page)
  end
end
