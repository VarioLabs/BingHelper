require 'yajl' 
require 'faraday'

module BingHelper
  class Bing
    
    attr_accessor :instance_options
    attr_reader :faraday_client

    API_URL="http://api.search.live.net/json.aspx"
    
    BASE_OPTIONS = [:version, :market, :adult, :query, :appid, :sources]
    
    # Query Keywords: <http://help.live.com/help.aspx?project=wl_searchv1&market=en-US&querytype=keyword&query=redliub&tmt=&domain=www.bing.com:80>
    #
    QUERY_KEYWORDS = [:site, :language, :contains, :filetype, :inanchor, :inbody, :intitle, :ip, :loc, :location, :prefer, :feed, :hasfeed, :url]

    # Source Types: <http://msdn.microsoft.com/en-us/library/dd250847.aspx>
    #
    SOURCES = %w(Ad Image InstantAnswer News Phonebook RelatedSearch Spell Web)

    # Set up methods for each search source:
    # +ad+, +image+, +instant_answer+, +news+, +phonebook+, +related_search+,
    # +spell+ and +web+
    #
    # Example:
    # 
    #   bing = RBing.new(YOUR_APP_ID)
    #   bing.web("ruby gems", :count => 10)
    #
    SOURCES.each do |source|
      fn = source.to_s.gsub(/[a-z][A-Z]/) {|c| "#{c[0,1]}_#{c[1,1]}" }.downcase
      class_eval "def #{fn}(query, options={}) ; search('#{source}', query, options) ; end"
      class_eval "def #{fn}_search_params(query, options={}) ; query_params_for('#{source}', query, options) ; end"
    end
    
    def search(source, query, options={})
      response = self.faraday_client.get do |req|
        req.url "", query_params_for(source, query, options)
      end
      begin
        Response.new(Yajl::Parser.new.parse(response.body))
      rescue
        nil
      end
    end

    def query_params_for(source, query, options)
    
      final_options = self.instance_options.merge({:sources=>source, :query=>build_query(query, options)})
      final_options.merge(clean_options(options))
      
    end

    def initialize(app_id, options={})
      self.instance_options = options.merge(:AppId=>app_id)
    end

    def faraday_client
      @faraday_client ||= Faraday.new(:url => API_URL) do |builder|
        builder.request  :url_encoded
        builder.request  :json
        builder.response :logger if ENV["RACK_ENV"] && ENV["RACK_ENV"] == 'development'
        builder.adapter  ((defined?(EM::Synchrony) && EM.reactor_running? ) ? :em_synchrony : :net_http)
      end
      
    end
    
    def self.base_url
      return API_URL
    end
    

    private     
    
    def clean_options(options)
      options.select do |k,v|
        k != :query && k != :sources && BASE_OPTIONS.include?(k)
      end
    end

    # constructs a query string for the given
    # +query+ and the optional query +options+
    #
    def build_query(query, options={})
      queries = []
      QUERY_KEYWORDS.each do |kw|
        next unless options[kw]
        if options[kw].is_a? Array
          kw_query = options[kw].map {|s| "#{kw}:#{s}".strip }.join(" OR ")
          queries << " (#{kw_query})"
        else
          queries << " #{kw}:#{options[kw]}"
        end
      end
      "#{query} #{queries.join(' ')}".strip
    end

    
  end
end