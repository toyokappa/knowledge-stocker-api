class Api::V1::WordsController < Api::V1::ApplicationController
  def show
    word = Word.find(params[:id])
    render json: word.as_json(methods: :knowledges)
  end
end
