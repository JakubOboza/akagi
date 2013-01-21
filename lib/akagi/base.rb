require 'rest_client'
require 'json'

module Akagi

  class Base

    attr_accessor :base_url, :team_id, :key

    def initialize(base_url, team_id, key)
      @base_url = base_url.to_s
      @key = key.to_s
      @team_id = team_id.to_s
    end

    def get(url)
      RestClient.get url, "HTTP_MIDWAY_API_KEY" => @key, :content_type => "application/json"      
    end

    def delete(url)
      RestClient.delete url, "HTTP_MIDWAY_API_KEY" => @key, :content_type => "application/json"
    end

    def post(url, payload = {})
      RestClient.post url, payload.to_json, "HTTP_MIDWAY_API_KEY" => @key, :content_type => "application/json"
    end

    def maps_url(extra_bit_of_url = "")
      extra_bit_of_url ||= ""
      File.join([@base_url, "teams", @team_id, "maps", extra_bit_of_url.to_s])
    end

    def game_url
      File.join(@base_url, "teams", @team_id, "game")
    end

    def maps
      self.get(self.maps_url())
    end

    def delete_map(map_id)
      self.delete(self.maps_url(map_id))
    end

    def add_map(map)
      self.post(self.maps_url(), {"grid" => map})
    end

    def game_status
      self.get(self.game_url)
    end

    def game_move(move = [])
      self.post(self.game_url, {"move" =>  move})
    end

  end

end

