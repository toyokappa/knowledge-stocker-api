class Api::V1::RankingsController < Api::V1::ApplicationController
  def show
    term = params[:term]
    users = User.rank_as_json(term: term)
    current_user_rank = users.index {|user| user["name"] == current_user.name } + 1
    render json: { users: users.slice(0, 5), currentUserRank: current_user_rank }
  end
end
