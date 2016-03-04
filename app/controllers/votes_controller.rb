class VotesController < ApplicationController

    def create
        @question = Question.find(params[:question_id])
        @question.user = current_user
        @vote = @question.votes.create
       	redirect_to @question
    end


end
