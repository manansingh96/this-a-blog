# Articles controller

class ArticlesController < ApplicationController
  # attr_accessor :article
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end
end
