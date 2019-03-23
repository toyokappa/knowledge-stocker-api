class Api::V1::RankingsController < Api::V1::ApplicationController
  def show
    term = params[:term]
    users = User.rank_as_json(term: term)
    current_user_rank = users.index {|user| user["name"] == current_user.name }
    current_user_ranking = users[current_user_rank].merge(rank: current_user_rank + 1) if current_user_rank
    render json: { users: users.slice(0, 5), currentUser: current_user_ranking }
  end
end
