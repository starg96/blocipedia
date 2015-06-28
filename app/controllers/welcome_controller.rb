class WelcomeController < ApplicationController
  def index
  	authorize :welcome
  end

  def about
  end
end
