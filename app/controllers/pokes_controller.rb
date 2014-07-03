class PokesController < ApplicationController
  def show
    @poke = Poke.find(params[:id])
  end

  def new
    @poke = Poke.new
  end

  def create
    @poke = Poke.new(poke_params)
    if @poke.save
    client['WDI Boston PokeChat'].send('username', "@#{@poke.target_username} was poked by #{@poke.author_line} #{poke_url(@poke)}", :notify => true, :message_format => 'text')

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

  def client
    HipChat::Client.new(ENV['HIPCHAT_TOKEN'], :api_version => 'v2')
  end

end
