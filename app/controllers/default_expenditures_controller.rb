class DefaultExpendituresController < ApplicationController
  before_action :find_default_expenditure, only: [:edit, :update]
  before_action :editable?, only: [:edit, :update]

  def index
    @default_expenditures = DefaultExpenditure.for_current_user(current_user).order(:user_id, :name)
  end

  def new
    @default_expenditure = current_user.default_expenditures.new
  end

  def create
    @default_expenditure = current_user.default_expenditures.new(default_expenditure_params)
    if @default_expenditure.save
      redirect_to default_expenditures_path, notice: 'Type added successfully'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @default_expenditure.update_attributes(default_expenditure_params)
      redirect_to default_expenditures_path, notice: 'Type altered successfully'
    else
      render action: :edit
    end
  end

  private

  def default_expenditure_params
    params.require(:default_expenditure).permit(:name)
  end

  def find_default_expenditure
    @default_expenditure = current_user.default_expenditures.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to default_expenditures_path, alert: 'You don\'t have sufficient privileges to edit this type'
  end

  def editable?
    unless @default_expenditure.editable?(current_user)
      redirect_to default_expenditures_path, alert: 'You don\'t have sufficient privileges to edit this type'
    end
  end
end
