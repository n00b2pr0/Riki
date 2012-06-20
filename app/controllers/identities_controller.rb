class IdentitiesController < ApplicationController
	# before_filter :should_be_logged_in
  def new
    @identity = env['omniauth.identity']
  end
end
