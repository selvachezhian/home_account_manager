class SecretsController < ApplicationController

  def index
    @secrets = current_user.secrets
  end

end
