class VotesController < ApplicationController

    before_action :load_votable

    def create
        @votable.votes.create(user_id: current_user.id)
       	redirect_to question_path(@path)
    end

    def destroy
        @votable.votes.where(user: current_user).take.try(:destroy)
	    redirect_to question_path(@path)
    end

    private 
        def load_votable            
             if params[:question_id]
                @votable = Question.find(params[:question_id])
                @path = @votable
            else
                @votable = Answer.find(params[:answer_id])
                @path = Question.find(@votable.question_id)
            end 
        end
end
