class ChallengesController < ApplicationController

  def show
    @challenge = Challenge.find(params[:id])
  end

  def update
    @current_user = current_user
    challenge = Challenge.find(params[:id])
    result = UserChallenge.find_or_create_by(user_id: current_user.id, challenge_id: challenge.id, success: params[:success])
    if result.success
      @current_page = challenge.success_page
      UserPage.create(user_id: current_user.id, page_id: @current_page.id)
    else
      @current_page = challenge.fail_page
      UserPage.create(user_id: current_user.id, page_id: @current_page.id)
    end
    redirect_to page_path(@current_page)
  end

end
