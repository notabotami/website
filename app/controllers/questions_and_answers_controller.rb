class QuestionsAndAnswersController < ApplicationController


  def questions_and_answers

    respond_to do |format|
      format.html
      format.js {}
    end
  end

end