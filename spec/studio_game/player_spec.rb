require 'studio_game/player'
require 'studio_game/treasure_trove.rb'

module StudioGame

  describe Player do
    before do
      @initial_health = 150
      @player = Player.new("larry", @initial_health)
      $stdout = StringIO.new
    end

    it "has a capitalized name" do
      expect(@player.name).to eq("Larry")
    end

    it "has an initial health" do
      expect(@player.health).to eq(150)
    end

    it "has a string representation" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))

      expect(@player.to_s).to eq("I'm Larry with health = 150, points = 100, and score = 250.")
    end

    it "computes a score as the sum of its health and points" do
      @player.found_treasure(Treasure.new(:hammer,50))
      @player.found_treasure(Treasure.new(:hammer,50))

      expect(@player.score).to eq(150 + 100)
    end

    it "increases health by 15 when w00ted" do
      @player.w00t

      expect(@player.health).to eq(@initial_health + 15)
    end

    it "decreases health by 10 when blammed" do
      @player.blam

      expect(@player.health).to eq(@initial_health - 10)
    end

    context "with a health greater than 100" do
      before do
        @player = Player.new("larry", 150)
      end

      it "is strong" do
        expect(@player).to be_strong
      end
    end

    context "with a health of 100 or less" do
      before do
        @player = Player.new("larry", 100)
      end

      it "is wimpy" do
        expect(@player).not_to be_strong
      end
    end

    it "computes points as the sum of all treasure points" do
    @player.points.should == 0

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 50

    @player.found_treasure(Treasure.new(:crowbar, 400))

    @player.points.should == 450

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 500
  end

  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
    ]
  end

  it "can be created from a CSV string" do
    player = Player.from_csv("larry,150")

    player.name.should == "Larry"
    player.health.should == 150
  end
  end
end
