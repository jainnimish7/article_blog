class WelcomeController < ApplicationController
  def index
  end

  def listing
    @users = User.all
  end
end
