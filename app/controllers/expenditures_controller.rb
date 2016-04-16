# @author Selva Chezhian
class ExpendituresController < ApplicationController
  # @!group Callbacks

  before_action :check_month_views_params, only: :month_views

  # @!endgroup

  def index
    @expenditures = current_user.expenditures.includes(:default_expenditure).for_current_month.order(:date, :name, :amount)
  end

  def new
    @expenditure = current_user.expenditures.new
  end

  def create
    @expenditure = current_user.expenditures.new(expenditure_params)
    if @expenditure.save
      redirect_to expenditures_path, notice: 'Expenditure added successfully'
    else
      render action: :new
    end
  end

  def edit
    @expenditure = current_user.expenditures.find(params[:id])
  end

  def update
    @expenditure = current_user.expenditures.find(params[:id])
    if @expenditure.update_attributes(expenditure_params)
      redirect_to expenditures_path, notice: 'Expenditure altered successfully'
    else
      render action: :edit
    end
  end

  def destroy
    @expenditure = current_user.expenditures.find(params[:id])
    @expenditure.destroy

    redirect_to expenditures_path, notice: 'Expenditure removed successfully'
  end

  def month_views
    @expenditures = current_user.expenditures.includes(:default_expenditure).for_selected_month(params[:month], params[:year]).order(:date, :name, :amount)
  end

  def year_glance
  end

  def manage_defaults
    @defaults = DefaultExpenditure.for_current_user(current_user).order(:user_id, :name)
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:name, :date, :amount, :default_expenditure_id)
  end

  def check_month_views_params
    redirect_to month_views_path(month: params[:month].slice(1), year: (params[:year] || Time.zone.now.year)), status: :moved_permanently if params[:month].starts_with?('0')
  end
end
