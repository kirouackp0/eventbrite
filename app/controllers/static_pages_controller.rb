class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret] # This ensures user is signed in for the index action

  # Your controller actions and code here
  def index
  end
  def secret
  end
end
