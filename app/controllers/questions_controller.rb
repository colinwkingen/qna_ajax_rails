class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render :index
  end

  def show
   @question = Question.find(params[:id])
   render :show
 end

 def new
   @question = Question.new
   render :new
 end

 def create
   @question = Question.new(question_params)
   if @question.save

     respond_to do |format|
       format.html { redirect_to root_path }
       format.js
     end
   else
     render :new
   end
 end

 def edit
   @question = Question.find(params[:id])
   render :edit
 end

 def update
   @question= Question.find(params[:id])
   if @question.update(question_params)
     respond_to do |format|
       format.html { redirect_to questions_path }
       format.js
     end
   else
     render :edit
   end
 end





 def destroy
   @question = Question.find(params[:id])
     @question.destroy
   redirect_to questions_path
 end


 private
 def question_params
   params.require(:question).permit(:title, :text)
 end

end
