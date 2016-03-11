class VotesController < ApplicationController

    def create
        @question = Question.find(params[:question_id])
        @vote = @question.votes.create(user_id: current_user.id)
       	redirect_to @question
    end

    def destroy
        @question = Question.find(params[:question_id])
        @question.votes.where(user: current_user).take.try(:destroy)
	    redirect_to @question
    end

end
