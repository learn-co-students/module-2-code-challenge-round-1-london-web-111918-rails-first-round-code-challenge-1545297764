class HeroinesController < ApplicationController

  def index
    @heroines = Heroine.all
    @powers = Power.all
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      render :new
    end
  end

  def power_filter
    @heroines = []
    Heroine.all.map do |heroine|
      if heroine.power_id == params[:power_id].to_i
        @heroines << heroine
      end
    end
    @powers = Power.all
    render :filter
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
