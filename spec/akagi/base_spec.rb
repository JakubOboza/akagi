require 'spec_helper'

describe Akagi::Base do

  before(:each) do
    @base_url = "http://localhost:3000"
    @team_id = "13"
    @key = "f94a8505949317a54c96c3d21de2007da2a3f139"
    @client = Akagi::Base.new(@base_url, @team_id, @key)
  end

  describe "maps" do

    it "can get maps list" do
      stub_request(:get, "http://localhost:3000/teams/13/maps/")
      @client.maps
      WebMock.should have_requested(:get, "http://localhost:3000/teams/13/maps/").with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Type'=>'application/json', 'Http-Midway-Api-Key'=>'f94a8505949317a54c96c3d21de2007da2a3f139', 'User-Agent'=>'Ruby'})
    end

    it "can delete map" do
      stub_request(:delete, "http://localhost:3000/teams/13/maps/1")
      @client.delete_map(1)
      WebMock.should have_requested(:delete, "http://localhost:3000/teams/13/maps/1").
         with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Type'=>'application/json', 'Http-Midway-Api-Key'=>'f94a8505949317a54c96c3d21de2007da2a3f139', 'User-Agent'=>'Ruby'})    
    end

    it "can add map" do
      stub_request(:post, "http://localhost:3000/teams/13/maps/")
      @client.add_map([[2, 1, 5, "across"], [0, 3, 4, "down"], [2, 6, 3, "across"], [6, 4, 3, "across"], [3, 4, 2, "down"]])
      WebMock.should have_requested(:post, "http://localhost:3000/teams/13/maps/").
         with(:body => "{\"grid\":[[2,1,5,\"across\"],[0,3,4,\"down\"],[2,6,3,\"across\"],[6,4,3,\"across\"],[3,4,2,\"down\"]]}",
              :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'91', 'Content-Type'=>'application/json', 'Http-Midway-Api-Key'=>'f94a8505949317a54c96c3d21de2007da2a3f139', 'User-Agent'=>'Ruby'})
    end


  end

  describe "game" do

    it "can check game status" do
      stub_request(:get, "http://localhost:3000/teams/13/game")
      @client.game_status
      WebMock.should have_requested(:get, "http://localhost:3000/teams/13/game").
         with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Type'=>'application/json', 'Http-Midway-Api-Key'=>'f94a8505949317a54c96c3d21de2007da2a3f139', 'User-Agent'=>'Ruby'})
    end

    it "can make game move" do
      stub_request(:post, "http://localhost:3000/teams/13/game")
      @client.game_move([2,1])
      WebMock.should have_requested(:post, "http://localhost:3000/teams/13/game").
         with(:body => "{\"move\":[2,1]}",
              :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'14', 'Content-Type'=>'application/json', 'Http-Midway-Api-Key'=>'f94a8505949317a54c96c3d21de2007da2a3f139', 'User-Agent'=>'Ruby'})
    end

  end

end
