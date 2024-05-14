class HealthCheckController < ApplicationController
  rescue_from(Exception) { head :service_unavailable }

  def show
    head :ok
  end
end