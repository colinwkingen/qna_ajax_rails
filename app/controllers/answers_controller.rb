class AnswersController < ApplicationController
  def index
    @answers = Answer.all
    render :index
  end
  def show
   @answer = Answer.find(params[:id])
   render :show
 end

 def new
   @answer = Answer.new
   render :new
 end

 def create
   @answer = Answer.new(question_params)
   if @answer.save
     redirect_to answers_path
   else
     render :new
   end
 end

 def edit
   @answer = Answer.find(params[:id])
   render :edit
 end

 def update
   @answer= Answer.find(params[:id])
   if @answer.update(answer_params)
     redirect_to answers_path
   else
     render :edit
   end
 end

 def destroy
   @answer = Answer.find(params[:id])
     @answer.destroy
   redirect_to answers_path
 end


 private
 def answer_params
   params.require(:answer).permit(:title, :text)
 end

end
