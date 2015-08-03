class EmployeeApplicationController < ApplicationController

  def employee_application

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

end