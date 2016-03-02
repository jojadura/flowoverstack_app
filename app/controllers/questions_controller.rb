class QuestionsController < ApplicationController
  def index
  	@questions = Question.all.order("created_at DESC")
  end

  def new
  	@question = Question.new
  end
end
