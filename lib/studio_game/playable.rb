module StudioGame

  module Playable

    def blam
      @health -= 10
      puts "#{self.name} got blammed!"
    end

    def w00t
      @health += 15
      puts "#{self.name} got w00ted!"
    end

    def strong?
      self.health > 100
    end

  end
end
