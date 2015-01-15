require 'rails_helper'

describe ChallengesController do

  describe "GET #show" do
    it "assigns the requested challenge to @challenge" do
      challenge = create(:challenge)
      get :show, id: challenge
      expect(assigns(:challenge)).to eq challenge
    end
    it "renders the :show template" do
    challenge = create(:challenge)
    get :show, id: challenge
    expect(response).to render_template :show
    end
  end

  describe "PATCH #update" do
    # it "updates the Challenge and User by posting a new UserChallenge join"
    # it "redirects to the appropirated success or failure page"
  end

end
