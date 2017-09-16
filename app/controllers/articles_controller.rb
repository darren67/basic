class ArticlesController < ApplicationController



    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    
     def index
       @articles = Article.all
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
        #render plain: params[:article].inspect
        #this will let any parameters in and will throw an erro because of it.
        #@article = Article.new(params[:article]) 
        @article = Article.new(params.require(:article).permit(:title, :text)) #this whitelists the required params from the form
        @article.save
        redirect_to @article
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

#index
#show
#new
#edit
#create
#update
#destroy


 