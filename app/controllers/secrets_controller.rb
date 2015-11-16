class SecretsController < ApplicationController

  before_action :get_secret, only: [:edit, :update, :manage_values]

  def index
    @secrets = current_user.secrets
  end

  def new
    @secret = current_user.secrets.new
  end

  def create
    @secret = current_user.secrets.new(secret_params)
    if @secret.save
      redirect_to secrets_path, notice: 'Secret added successfully'
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @secret.update_attributes(secret_params)
      redirect_to secrets_path, notice: 'Secret altered successfully'
    else
      render action: :edit
    end
  end

  def manage_values

  end

  def add_new_value

  end

  private

  def secret_params
    params.require(:secret).permit(:name)
  end

  def get_secret
    begin
      @secret = current_user.secrets.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to secrets_path, alert: "Couldn't find any valid secrets for you.  Please try again."
    end
  end

end
