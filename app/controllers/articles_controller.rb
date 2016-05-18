class ArticlesController < ApplicationController
   def new
     @article = Article.new
   end

   def create
     @article = Article.new(article_params) # 接傳入的參數
     if @article.save
       flash[:notice] = "Article was successfully created"
       redirect_to article_path(@article)
     else # 檢核不過無法存檔時
       render 'new'
     end
   end

   def show
     @article = Article.find(params[:id])
   end
  
   private
   def article_params
     params.require(:article).permit(:title,:description)
   end

end