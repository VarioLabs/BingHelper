require 'spec_helper'

describe BingHelper::Bing do
  
  before :each do
    @bing = BingHelper::Bing.new(BingHelper::TEST_KEY)
  end
  
  it "should provide an ad search method" do
    @bing.should respond_to(:ad)
  end
  
  it "should provide an image search method" do
    @bing.should respond_to(:image)
  end
  
  it "should provide an instant_answer search method" do
    @bing.should respond_to(:instant_answer)
  end
  
  it "should provide a news search method" do
    @bing.should respond_to(:news)
  end
  
  it "should provide a phonebook search method" do
    @bing.should respond_to(:phonebook)
  end
  
  it "should provide a related_search method" do
    @bing.should respond_to(:related_search)
  end
  
  it "should provide an spell method" do
    @bing.should respond_to(:spell)
  end
  
  it "should provide a web search method" do
    @bing.should respond_to(:web)
  end
  
  it "should return a Hash object" do
    @bing.web("ruby").should be_a(BingHelper::Response)
  end
  
  it "should return search results" do
    @bing.web("ruby").web_results.should_not be_empty
  end
  
  it "should return a proper query hash for a basic query" do
    @bing.web_search_url("ruby").should == {:AppId=>"677F875FA3B101E68C6D516EFFF88B95444E63E1", :sources=>"Web", :query=>"ruby"}
  end
  
  
  
end