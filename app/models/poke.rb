class Poke < ActiveRecord::Base
  validates :author_line, :target_username, :content, presence: true
  after_commit :send_to_hipchat, on: :create

  private

  def send_to_hipchat
    poke_url = Rails.application.routes.url_helpers.poke_url(self)

    if is_private
      message = "You got poked by #{author_line}: #{poke_url}"
      Poker.new.private_message(target_username, message)
    else
      message = "@#{target_username} got poked by #{author_line}: #{poke_url}"
      Poker.new.public_message(message)
    end
  end
end
