# encoding: UTF-8
require 'spec_helper'

describe BingHelper::Response do
  
  it "should have properly line up a web response" do
    @web_response.web_total.should == 1830000
    @web_response.web_results.should_not be_empty
    @web_response.web_results.length.should == 1
    @web_response.web_results_offset.should == 0
    @web_response.version.should == "2.2"
  end

  it "should have properly line up a image response" do
    @image_response.image_total.should == 1980000
    @image_response.image_results.should_not be_empty
    @image_response.image_results.length.should == 1
    @image_response.image_results_offset.should == 0
    @image_response.version.should == "2.2"
  end
  
  it "should have properly line up a news response" do
    @news_response.news_total.should == 65900
    @news_response.news_results.should_not be_empty
    @news_response.news_results.length.should == 2
    @news_response.news_results_offset.should == 0
    @news_response.version.should == "2.2"
  end
  
  it "should have properly line up a related_search response" do
    @related_response.related_search_total.should be_nil
    @related_response.related_search_results.should_not be_empty
    @related_response.related_search_results.length.should == 8
    @related_response.related_search_results_offset.should be_nil
    @related_response.version.should == "2.2"
  end
  
  
  
  
  before :all do
    @news_json = <<END_NEWS
    {
      "SearchResponse": 
      {
        "News":
        {
          "Offset": 0,
          "Results":
          [
    	      {
    	        "BreakingNews": 0,
    	        "Date": "2011-12-01T03:55:00Z",
    	        "Snippet":"At 4-7, the Seahawks are rebuilding while the Philadelphia Eagles are reeling and those two story lines provide the most compelling tension for Thursday's prime-time intersection. For Seattle, there is still a question of what these Seahawks ...",
    	        "Source":"Seattle Times",
    	        "Title":"Seahawks, Eagles are similar only in their 4-7 records",
    	        "Url":"http:\/\/seattletimes.nwsource.com\/html\/seahawks\/2016900763_hawk01.html"
    	      },
    	      {
    	        "BreakingNews": 0,
    	        "Date":"2011-12-01T02:14:47Z",
    	        "NewsCollections":[
    	          {
    	            "Name":"RelatedTextArticles",
    	            "NewsArticles":[
    	              {
    	                "Date":"2011-11-29T01:12:44Z",
    	                "Snippet":"PHILADELPHIA (AP) - Fans are calling for Andy Reid's dismissal more vehemently than ever. Assistant coaches are arguing on the sideline. A disgruntled star player isn't giving his best effort. There's no saving the Philadelphia Eagles this season. The best ...",
    	                "Source":"NBC Sports",
    	                "Title":"Eagles, Reid left to pick up the pieces",
    	                "Url":"http:\/\/nbcsports.msnbc.com\/id\/45470523"
    	              },
    	              {
    	                "Date":"2011-11-30T13:00:13Z",
    	                "Snippet":"Eagles Pro Bowl WR\/PR DeSean Jackson will return to the starting lineup Thursday night in Seattle. The rest of his future is far murkier. Jackson is in the final year of his rookie deal, which pays him $600,000 in 2011, but isn't playing or behaving like ...",
    	                "Source":"USA Today",
    	                "Title":"Vote: What should the Eagles do with DeSean Jackson?",
    	                "Url":"http:\/\/content.usatoday.com\/communities\/thehuddle\/post\/2011\/11\/vote-what-should-the-eagles-do-with-desean-jackson\/1"
    	              }
    	            ]
    	          }
    	        ],
    	        "Snippet":"As the Philadelphia Eagles did the quick turnaround this week to prepare for their cross-country trek to play the Seahawks, they readily admitted that things don't look so good right now. It would be hard to argue otherwise, particularly after ...",
    	        "Source":"News-Democrat",
    	        "Title":"As the Eagles' soap opera turns ...",
    	        "Url":"http:\/\/www.bnd.com\/2011\/11\/30\/v-print\/1962085\/as-the-eagles-soap-opera-turns.html"
    	      }
          ],
          "Total": 65900
        },
        "Query":
        {
          "SearchTerms": "eagles"
        },
        "Version": "2.2"
      }
    }
END_NEWS
  
    @web_json = <<END_WEB
    {
    "SearchResponse":
    {
    "Query":
    {
    "SearchTerms":
    "eagles"
    },
    "Version":
    "2.2",
    "Web":
    {
    "Offset":
    0,
    "Results":
    [
    {
    "CacheUrl":
    "http:\/\/cc.bingj.com\/cache.aspx?q=eagles&d=5015774834000721&mkt=en-US&w=401ef524,5c68a585",
    "DateTime":
    "2011-11-28T08:33:00Z",
    "DeepLinks":
    [
    {
    "Title":
    "Schedule",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/gameday\/schedule.html"
    },
    {
    "Title":
    "News",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/news\/"
    },
    {
    "Title":
    "Roster",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/team\/roster.html"
    },
    {
    "Title":
    "Bloghead",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/Bloghead\/"
    },
    {
    "Title":
    "Shop",
    "Url":
    "http:\/\/store.philadelphiaeagles.com\/"
    },
    {
    "Title":
    "Discussion Boards",
    "Url":
    "http:\/\/boards.philadelphiaeagles.com\/"
    },
    {
    "Title":
    "Transactions",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/team\/transactions.html"
    },
    {
    "Title":
    "Eagles Media Guide",
    "Url":
    "http:\/\/legacy.philadelphiaeagles.com\/eagles_files\/html\/depth_chart_rosters_1.html"
    },
    {
    "Title":
    "On The Inside",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/news\/OnTheInside.html"
    },
    {
    "Title":
    "Gameday",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/gameday\/"
    },
    {
    "Title":
    "Sold Out",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/news\/article-1\/Sold-Out\/4ad51057-0c6d-40d2-b262-9bff6d04a75d"
    },
    {
    "Title":
    "Media",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/multimedia\/"
    },
    {
    "Title":
    "Eagles' Team Needs",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/multimedia\/videos\/Eagles-Team-Needs\/48242ace-5c2c-4112-a094-829358470bef"
    }
    ],
    "Description":
    "Official team site. Roster, team news, history, youth programs, and ticket information.",
    "DisplayUrl":
    "www.philadelphiaeagles.com",
    "Title":
    "Philadelphia Eagles",
    "Url":
    "http:\/\/www.philadelphiaeagles.com\/"
    }
    ],
    "Total":
    1830000
    }
    }
    }
END_WEB

    @image_json = <<END_IMAGE
    {
    "SearchResponse":
    {
    "Image":
    {
    "Offset":
    0,
    "Results":
    [
    {
    "ContentType":
    "image\/jpeg",
    "DisplayUrl":
    "http:\/\/lyrics.wikia.com\/Eagles",
    "FileSize":
    26463,
    "Height":
    419,
    "MediaUrl":
    "http:\/\/images.wikia.com\/lyricwiki\/images\/5\/59\/The_Eagles.jpg",
    "Thumbnail":
    {
    "ContentType":
    "image\/jpeg",
    "FileSize":
    3812,
    "Height":
    134,
    "Url":
    "http:\/\/ts1.mm.bing.net\/images\/thumbnail.aspx?q=1310066356354&id=c6cbd98af9fe635fe49b49c43e17ff72",
    "Width":
    160
    },
    "Title":
    "Eagles Lyrics - Lyric Wiki - song lyrics, music lyrics",
    "Url":
    "http:\/\/lyrics.wikia.com\/Eagles",
    "Width":
    500
    }
    ],
    "Total":
    1980000
    },
    "Query":
    {
    "SearchTerms":
    "eagles"
    },
    "Version":
    "2.2"
    }
    }
END_IMAGE

    @related_json = <<END_INSTANT
    {
    "SearchResponse":
    {
    "Query":
    {
    "SearchTerms":
    "Joe Scarborough"
    },
    "RelatedSearch":
    {
    "Results":
    [
    {
    "Title":
    "Joe Scarborough Affair",
    "Url":
    "http:\/\/www.bing.com\/search?q=Joe+Scarborough+Affair"
    },
    {
    "Title":
    "Joe Scarborough Wife",
    "Url":
    "http:\/\/www.bing.com\/search?q=Joe+Scarborough+Wife"
    },
    {
    "Title":
    "Joe Scarborough Baby",
    "Url":
    "http:\/\/www.bing.com\/search?q=Joe+Scarborough+Baby"
    },
    {
    "Title":
    "Joe Scarborough Scandal",
    "Url":
    "http:\/\/www.bing.com\/search?q=Joe+Scarborough+Scandal"
    },
    {
    "Title":
    "Joe Scarborough and Mika",
    "Url":
    "http:\/\/www.bing.com\/search?q=Joe+Scarborough+and+Mika"
    },
    {
    "Title":
    "Joe Scarborough Biography",
    "Url":
    "http:\/\/www.bing.com\/search?q=Joe+Scarborough+Biography"
    },
    {
    "Title":
    "Joe Scarborough Radio Show",
    "Url":
    "http:\/\/www.bing.com\/search?q=Joe+Scarborough+Radio+Show"
    },
    {
    "Title":
    "Email Joe Scarborough at MSNBC",
    "Url":
    "http:\/\/www.bing.com\/search?q=Email+Joe+Scarborough+at+MSNBC"
    }
    ]
    },
    "Version":
    "2.2"
    }
    }
END_INSTANT

    @web_response = BingHelper::Response.new(Yajl::Parser.new.parse(@web_json))
    @image_response = BingHelper::Response.new(Yajl::Parser.new.parse(@image_json))
    @news_response = BingHelper::Response.new(Yajl::Parser.new.parse(@news_json))
    @related_response = BingHelper::Response.new(Yajl::Parser.new.parse(@related_json))

  end  
  
end