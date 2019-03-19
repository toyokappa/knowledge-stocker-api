class Api::V1::WordsController < Api::V1::ApplicationController
  before_action :set_word

  def show
    render json: @word.as_json(methods: :knowledges)
  end

  def update
    return render json: { errors: "User can't update." }, status: 403 if current_user != @word.user

    @word.update!(word_params)
    render json: @word.as_json(methods: :knowledges)
  end

  private

    def set_word
      @word = Word.find(params[:id])
    end

    def word_params
      params.permit(:text)
    end
end
