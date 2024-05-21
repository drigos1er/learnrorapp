class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit,:update, :destroy]
    def show
        
    end
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def edit
    end

    def create
        @article = Article.new(params_artcicle)
        flash[:notice] = "Article was created successfully."
        if @article.save
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
       
        if @article.update(params_artcicle)
            flash[:notice] = "Article was edited successfully."
            redirect_to article_path(@article)
        else
            render 'edit'
        end

    end

    def destroy
       
        @article.destroy
            flash[:notice] = "Article was detroy successfully."
            redirect_to articles_path
        

    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def params_artcicle
        params.require(:article).permit(:title,:description)
    end
  
end
