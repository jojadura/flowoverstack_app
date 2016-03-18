class AnswersController < ApplicationController

    def create
        @question = Question.find(params[:question_id])  
        @answer = @question.answers.new(answer_params)
        if @answer.save      
        	redirect_to @question
        else
          @question = Question.find(params[:question_id])
          render "questions/show"
        end   
    end

    private 
      def answer_params
        params.require(:answer).permit(:body,:user_id)
      end

end
