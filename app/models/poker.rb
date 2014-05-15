class Poker
  def target_mention_names
    targets.map{ |user| user['mention_name'] }
  end

  def public_message(message)
    room.send('', message, message_format: 'text')
  end

  def private_message(mention_name, message)
    user_id = targets.find{ |user| user['mention_name'] == mention_name }['id']
    client.user(user_id).send(message)
  end

  private

  def client
    HipChat::Client.new(ENV['HIPCHAT_API_KEY'], api_version: 'v2')
  end

  def room
    client['WDI Boston PokeChat']
  end

  def targets
    room.get_room['participants']
  end
end
