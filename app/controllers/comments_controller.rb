class CommentsController < ApplicationController

    before_action :load_commentable

    def create
        @question.comments.new(comment_params)
        if @question.save      
        	redirect_to question_path(@path)
        else
          @answer = Answer.new  # Esta var, es para poder usar en la vista @answer.errors.any?, para las validaciones.
          @comment = Comment.new 
          @question = Question.find(params[:question_id])
          render "questions/show"
        end   
    end

    private 
        def load_commentable            
             if params[:question_id]
                @question = Question.find(params[:question_id])
                @path = @question
            else
                @question = Answer.find(params[:answer_id])
                @path = Question.find(@question.question_id)
            end 
        end


    private 
      def comment_params
        params.require(:comment).permit(:body,:user_id)
      end
end


