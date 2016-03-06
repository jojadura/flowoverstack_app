class VotesController < ApplicationController

    def create
        @question = Question.find(params[:question_id])
        @vote = @question.votes.create(user_id: current_user.id)
       	redirect_to @question
    end

end
