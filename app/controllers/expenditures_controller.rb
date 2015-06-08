class ExpendituresController < ApplicationController

  def index
    @expenditures = current_user.expenditures.for_current_month.order(:date, :name, :amount)
  end

  def new
    @expenditure = current_user.expenditures.new
  end

  def create
    @expenditure = current_user.expenditures.new(expenditure_params)
    if @expenditure.save
      redirect_to expenditures_path, notice: "#{@expenditure.name} added successfully"
    else
      render action: :new
    end
  end

  def month_views

  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:name, :date, :amount)
  end

end
