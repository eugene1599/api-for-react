require 'action_controller'

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_user!, unless: :devise_controller?

  def tst
    pry
  end

  private

  def _run_options(options)
    options.merge('current_user' => current_user.id)
  end
end
