class BeersController < ApplicationController
  before_filter :authorize

  def index
    @beers = current_user.beers.all
    @beers.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end

  def new
    @beer = current_user.beers.new
  end

  def create
    @beer = current_user.beers.new(user_params)

    if @beer.save
      flash[:success] = "Oh man, I bet that tasted good!"
      redirect_to beers_path
    elsif @beer.name.empty?
      flash[:error]= "Looks like you had a few too many and left off the name."
      render :new
    else
      flash[:error]= "Sorry that didn't taste quite right. Try drinking it again."
      render :new
    end
  end

  def edit
    @beer = current_user.beers.find(params[:id])
  end

  def update
    @beer = current_user.beers.find(params[:id])
    @beer.update_attributes(user_params)
    redirect_to beers_path
  end

  private

  def user_params
    params.require(:beer).permit(:name, :description, :brewery)
  end
end
