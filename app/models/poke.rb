class Poke < ActiveRecord::Base
  validates :author_line, :target_username, :content, presence: true
end
