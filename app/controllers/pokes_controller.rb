class PokesController < ApplicationController
  def show
    @poke = Poke.find(params[:id])
  end

  def new
    @poke = Poke.new
    @targets = Poker.new.target_mention_names.sort
  end

  def create
    @poke = Poke.new(poke_params)

    if @poke.save
      redirect_to @poke, success: 'Target has been poked!'
    else
      flash.now.alert = "Slight problem: #{@poke.errors.full_messages.join(', ')}"
      render :new
    end
  end

  private

  def poke_params
    params.require(:poke).permit(:author_line, :target_username, :content, :is_private)
  end
end
