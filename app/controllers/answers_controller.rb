class AnswersController < ApplicationController
  def index
    @answers = Answer.all
    render :index
  end

  def show

  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer successfully added!"
      respond_to do |format|
        format.html { redirect_to question_path(@answer.question) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer successfully updated!"
      respond_to do |format|
        format.html { redirect_to question_path(@answer.question) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer successfully deleted."
    redirect_to question_path(@answer.question)
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :text, :question_id)
  end
end
