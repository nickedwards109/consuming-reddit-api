class User < ApplicationRecord
  attr_accessor :username, :karma

  def set_attributes
    attributes = RedditService.get_attributes(self)
    self.username = attributes[:name]
    self.karma = attributes[:link_karma] + attributes[:comment_karma]
  end
end
