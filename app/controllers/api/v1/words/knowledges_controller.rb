class Api::V1::Words::KnowledgesController < Api::V1::ApplicationController
  def create
    word = Word.find(params[:word_id])
    word.knowledges.create!(knowledge_params)
    render json: word.knowledges
  end
  
  private
  
    def knowledge_params
      title = WebScraper.get_title(params[:url])
      params.permit(:url, :understanding).merge(title: title)
    end
end