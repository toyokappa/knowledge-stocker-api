class Api::V1::Users::AchievementsController < Api::V1::ApplicationController
  def show
    user             = User.find_by!(name: params[:user_name])
    words            = user.words
    understood_words = words.with_understood
    knowledges       = user.knowledges

    word_length       = words.length
    understood_length = understood_words.length

    understood_rate   = words.present? ? (understood_length.to_d / word_length.to_d * 100).floor : 0
    understandings    = knowledges.with_max_understandings.values
    ave_understanding = understandings.present? ? mean(understandings).floor(2) : "-"

    achievement = {
      wordLength: word_length,
      understoodLength: understood_length,
      knowledgeLength: knowledges.length,
      understoodRate: understood_rate,
      aveUnderstanding: ave_understanding,
    }
    render json: achievement
  end

  private

    # FIXME: 強引な処理。Array Classをオーバーライドするべきか
    def mean(array)
      array.sum / array.length
    end
end
