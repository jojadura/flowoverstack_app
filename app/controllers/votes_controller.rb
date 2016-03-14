class VotesController < ApplicationController

    before_action :load_vot

    def create
        @vote = @question.votes.create(user_id: current_user.id)
       	redirect_to question_path
    end

    def destroy
        @question.votes.where(user: current_user).take.try(:destroy)
	    redirect_to question_path
    end

    private 
        def load_vot
             if params[:question_id]
                @question = Question.find(params[:question_id])
            else
                @question = Answer.find(params[:id])
            end 
        end

end
