class CommentsController < ApplicationController

    before_action :load_commentable

    def create
        @commentable.comments.new(comment_params)
        if @commentable.save      
        	redirect_to @question
        else
          @commentable = Question.find(params[:question_id])
          render "questions/show"
        end   
    end

    private 
        def load_commentable            
             if params[:question_id]
                @commentable = Question.find(params[:question_id])
                @path = @votable
            else
                @commentable = Answer.find(params[:answer_id])
                @path = Question.find(@commentable.question_id)
            end 
        end


    private 
      def comment_params
        params.require(:comment).permit(:body,:user_id)
      end
end


