class Hipchat
  def poke_target_mention_names
    poke_room.get_room['participants'].map{ |user| user['mention_name'] }
  end

  def poke_room_message(message)
    poke_room.send('', message, message_format: 'text')
  end

  def private_message(mention_name, message)
    user_id = poke_targets.find{ |user| user['mention_name'] == mention_name }['id']
    client.user(user_id).send(message)
  end

  private

  def client
    HipChat::Client.new(ENV['HIPCHAT_API_KEY'], api_version: 'v2')
  end

  def poke_room
    client['WDI Boston PokeChat']
  end

  def poke_targets
    poke_room.get_room['participants']
  end
end
