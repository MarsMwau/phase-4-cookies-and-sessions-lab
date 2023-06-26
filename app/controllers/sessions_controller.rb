class SessionsController < ApplicationController
    lass ArticlesController < ApplicationController
  def index
    render json: { articles: all_articles }
  end

  def show
    session[:page_views] ||= 0
    session[:page_views] += 1

    if session[:page_views] < 3
      render json: { article: find_article(params[:id]) }
    elsif session[:page_views] == 3
      render json: { article: find_article(params[:id]) }
    else
      render json: { error: "You have exceeded the maximum number of page views.", status: 401 }
    end
  end

  private

  def all_articles
    # Replace this with your actual implementation to fetch all articles from your database or any other source
    [
      { id: 1, title: "Article 1", content: "Article 1 content" },
      { id: 2, title: "Article 2", content: "Article 2 content" },
      { id: 3, title: "Article 3", content: "Article 3 content" }
    ]
  end

  def find_article(id)
    # Replace this with your actual implementation to find an article by ID from your database or any other source
    all_articles.find { |article| article[:id] == id.to_i }
  end
      
end
