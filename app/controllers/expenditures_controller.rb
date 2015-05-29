class ExpendituresController < ApplicationController

  def index
    @expenditures = current_user.expenditures.all
  end

  def new
    @expenditure = current_user.expenditures.new
  end
end
