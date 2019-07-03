class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit]

  def index
  end

  def new
  end
  def edit
  end
end
