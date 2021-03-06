class Api::V1::Words::KnowledgesController < Api::V1::ApplicationController
  # TODO: knowledgesの並び順を整理する
  def create
    word = Word.find(params[:word_id])
    word.knowledges.create!(knowledge_params)
    render json: word.knowledges.order_understanding_desc
  end

  def update
    knowledge = Knowledge.find(params[:id])
    knowledge.update!(knowledge_params)
    render json: knowledge.word.knowledges.order_understanding_desc # ここの書き方が微妙
  end

  def destroy
    knowledge = Knowledge.find(params[:id])
    knowledge.destroy!
    render json: knowledge.word.knowledges.order_understanding_desc # ここの書き方が微妙
  end

  private

    def knowledge_params
      title = WebScraper.get_title(params[:url])
      params.permit(:url, :understanding).merge(title: title)
    end
end
