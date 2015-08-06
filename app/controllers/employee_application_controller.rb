class EmployeeApplicationController < ApplicationController

  def employee_application

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

  def employee_application_submit

    logger.tagged("employee_application_submit") {logger.debug "Made it!"}
    ExampleMailer.employment_email(params[:file]).deliver!
    redirect_to "/employee_application"
  end

end