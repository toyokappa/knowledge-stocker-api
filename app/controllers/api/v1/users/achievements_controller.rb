class Api::V1::Users::AchievementsController < Api::V1::ApplicationController
  def show
    user = User.find_by!(name: params[:user_name])
    word_length = user.words.length
    understood_length = user.words.joins(:knowledges).group(:id).length
    understood_rate = word_length > 0 ? (understood_length.to_d / word_length.to_d * 100).floor : 0
    knowledge_length = user.knowledges.length
    understandings = user.words.map {|w| w.knowledges.pluck(:understanding).max }
    ave_understanding = understandings.length > 0 ? (understandings.sum / understandings.length).floor(2) : "-"
    achievement = {
      wordLength: word_length,
      understoodLength: understood_length,
      understoodRate: understood_rate,
      knowledgeLength: knowledge_length,
      aveUnderstanding: ave_understanding,
    }
    render json: achievement
  end
end