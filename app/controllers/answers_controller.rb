class AnswersController < ApplicationController
  # def index
  #   @questions = Question.all
  # end

  # def show
  #   @answer = Answer.find(params[:id])
  # end

  def new
    @answer = Answer.new
    @questions = Question.all
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.save

    if @answer.save
      redirect_to rooms_path, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @answers = Answer.where(user: current_user)
    @answers.destroy_all
    redirect_to new_answer_path
  end

  def answer_params
    params.require(:answer).permit(
      :question_id,
      :user_id,
      :score
    )
  end
end
