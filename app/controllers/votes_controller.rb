class VotesController < ApplicationController

    def create
        @question = Question.find(params[:question_id])
        @vote = @question.votes.create
       	redirect_to @question
    end


end
