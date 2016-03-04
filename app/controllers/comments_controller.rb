class CommentsController < ApplicationController

    def create
        @question = Question.find(params[:question_id])  #rake routes muestra /posts/:post_id/comments, de ahi sale :post_id, que es el valor que va por la URL.    
        @comment = @question.comments.new(comment_params)
        if @comment.save      
        	redirect_to @question
        else
          @question = Question.find(params[:question_id])
          render "questions/show"
        end   
    end

    private 
      def comment_params
        params.require(:comment).permit(:body,:user_id)
      end
end
