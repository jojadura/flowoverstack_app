class CommentsController < ApplicationController

    before_action :load_commentable

    def create
        @comment = @commentable.comments.new(comment_params)      
        if @comment.save      
        	redirect_to question_path(@question)
        else 
          @answer = Answer.new  # Esta var, es para poder usar en la vista @answer.errors.any?, para las validaciones.
          render "questions/show"
        end   
    end

    private 
        def load_commentable            
             if params[:question_id]
                @commentable = Question.find(params[:question_id])
                @question = @commentable
            else
                @commentable = Answer.find(params[:answer_id])
                @question = Question.find(@commentable.question_id)
            end 
        end


    private 
      def comment_params
        params.require(:comment).permit(:body,:user_id)
      end
end


