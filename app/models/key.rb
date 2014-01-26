class Key < ActiveRecord::Base
  attr_accessible :name



  # helper method to generate redis keys
  def redis_key(str)
    "user:#{self.id}:#{str}"
  end

end
