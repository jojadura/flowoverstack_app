class QuestionsController < ApplicationController
  def index
  	@questions = Question.all.order("created_at DESC")
  end

  def new
  	@question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to questions_path, notice: "La Pregunta fue creada exitosamente."
    else
      render :new   # se ubica de nuevo en la vista que se indique
    end		
  end

  def show
    @question = Question.find(params[:id])    
    #Para el comentario, que pertenece a un post especifico.
    @comment = Comment.new
    @answer = Answer.new
  end


  private 
    def question_params
      params.require(:question).permit(:title, :body)		
    end


end
