class ExpendituresController < ApplicationController

  before_action :check_month_views_params, only: :month_views

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
    selected_year = params[:year] || Time.zone.now.year
    @expenditures = current_user.expenditures.for_selected_month(params[:month], params[:year]).order(:date, :name, :amount)
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:name, :date, :amount)
  end

  def check_month_views_params
    redirect_to month_views_path(month: params[:month].slice(1), year: (params[:year] || Time.zone.now.year)), status: :moved_permanently if params[:month].starts_with?('0')
  end

end
