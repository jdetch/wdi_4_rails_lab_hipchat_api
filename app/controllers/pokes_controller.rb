class PokesController < ApplicationController
  def show
    @poke = Poke.find(params[:id])
  end

  def new
    @poke = Poke.new
    @client = client
  end

  def create
    @poke = Poke.new(poke_params)
    if @poke.save
    if @poke.is_private
     client.user(get_user_id(@poke.target_username)).send("You got poked by #{@poke.author_line}: #{poke_url(@poke)}")
    else
      client['WDI Boston PokeChat'].send(@poke.author_line, "@#{@poke.target_username} got poked by #{@poke.author_line}: #{poke_url(@poke)}", notify: true, message_format: "text")
    end
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

  def get_user_id(target_username)
    client['WDI Boston PokeChat'].get_room['participants'].find {|p| p['mention_name'] == target_username}['id']
  end

  def client
    HipChat::Client.new(ENV['HIPCHAT_TOKEN'], :api_version => 'v2')
  end

end
