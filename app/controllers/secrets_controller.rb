# :nodoc:
class SecretsController < ApplicationController
  before_action :set_secret, only: [:edit,
                                    :update,
                                    :manage_values,
                                    :add_new_value,
                                    :create_value,
                                    :update_value
  ].freeze

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
    @secret_value = @secret.secret_values.new
    render layout: false
  end

  def create_value
    @secret_value = @secret.secret_values.new(secret_value_params)
    if @secret_value.save
      render partial: 'secret_value',
             locals: { secret_value: @secret_value },
             status: :created
    else
      render nothing: true, status: :internal_server_error
    end
  end

  def update_value
  end

  private

  def secret_params
    params.require(:secret).permit(:name)
  end

  def secret_value_params
    params.require(:secret).permit(:key, :value)
  end

  def set_secret
    @secret = current_user.secrets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    alert_msg = "Couldn't find any valid secrets for you.  Please try again."
    redirect_to secrets_path, alert: alert_msg
  end
end
