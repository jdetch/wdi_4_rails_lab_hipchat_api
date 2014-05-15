class Poke < ActiveRecord::Base
  validates :author_line, :target_username, :content, presence: true
  after_commit :send_to_hipchat, on: :create

  private

  def send_to_hipchat
    room_name = 'WDI Boston PokeChat'
    client = HipChat::Client.new(ENV['HIPCHAT_API_KEY'], api_version: 'v2')
    poke_url = Rails.application.routes.url_helpers.poke_url(self)

    message = "@#{target_username} got poked by #{author_line}: #{poke_url}"
    client[room_name].send('', message, message_format: 'text')
  end
end
