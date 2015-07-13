class DefaultsController < ApplicationController

  def new
    @default_expenditure = current_user.default_expenditures.new
  end

end
