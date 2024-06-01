class SearchesController < ApplicationController
    before_action :authenticate_user!
    
    def search
      @model = params[:model] #paramsはformで打たれた情報を受け取るメソッド、
      @content = params[:content]
      @method = params[:method]
     
    if @model  == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Book.search_for(@content, @method)
    end
        
    end 
end
