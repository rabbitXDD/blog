class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    if params[:title].present?
    @articles=@articles.where("title like?","%#{params[:title]}%")
    end
    if params[:content].present?
    @articles=@articles.where("content like?","%#{params[:content]}%")
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
  	@article = Article.new
  end	
def edit
  @article = Article.find(params[:id])
end
def create
  @article = Article.new(article_params)
 
  if @article.save
    redirect_to @article
  else 
    render 'new'
  end
end
def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end
 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end

class Event < ActiveRecord::Base 
  #... 
  def title
  # 根據其他屬性的值或條件，來決定這個欄位的值 
  end 
  def title=(value) 
  # 根據value，來調整其他屬性的值 
  end 
  def text
  # 根據其他屬性的值或條件，來決定這個欄位的值 
  end 
  def text=(value) 
  # 根據value，來調整其他屬性的值 
  end 
end