module BingHelper
  class Response
    
    attr_reader :raw_response
    
    BingHelper::Bing::SOURCES.each do |source|
      fn = source.to_s.gsub(/[a-z][A-Z]/) {|c| "#{c[0,1]}_#{c[1,1]}" }.downcase
      class_eval "def #{fn}_results; @#{fn}_results ||= raw_response['SearchResponse']['#{source}']['Results']; end"
      class_eval "def #{fn}_results_offset; @#{fn}_results_offset ||= raw_response['SearchResponse']['#{source}']['Offset']; end"
      class_eval "def #{fn}_total; @#{fn}_total ||= raw_response['SearchResponse']['#{source}']['Total']; end"
    end
    
    def version
      @version ||= raw_response["SearchResponse"]["Version"]
    end
    
    def query
      @query ||= raw_response["SearchResponse"]["Query"]
    end
  
    def initialize(response)
      @raw_response = response
    end
    
  end
end