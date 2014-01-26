class Keypath < ActiveRecord::Base
  attr_accessible :name

  # find all key in path
  def keys?
    $redis.keys("#{self.name}*")
  end


  def value?(key)
    case $redis.type(key)
      when "string"
        $redis.get(key)
      when "list"
        $redis.lrange(key, 0, -1)
      when "hash"
        $redis.hgetall(key)
    end

  end



  # helper method to generate redis keys
  def redis_key(str)
    "user:#{self.id}:#{str}"
  end


end
