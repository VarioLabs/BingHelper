# bing-helper - WORK IN PROGRESS

Thin wrapper for bing API options. Needed a flexible library that would let me plug in different HTTP options seamlessly while being eminently lazy. The gem has two primary purposes: 

1. Build the query string & URL
2. Parse the response

That's all I need, and that's what it does.

Portions taken from our fork of Mike Demers's RBing library.

This client is for non-map API calls for now.

## Usage

It's a pretty simple client:

    @bing = BingHelper::Bing.new("YOUR API KEY")
    results = @bing.web("ruby")
    puts "Got #{results["SearchResponse"]["Web"]["Results"].length}
    results"

## Testing Notes

To test this, please create a `spec/test-key.rb` file that looks like
this:

    module BingHelper
      TEST_KEY="<YOUR BING API KEY HERE"
    end

You need your Bing API key in order to execute some of the tests. This
way, the key doesn't need to be checked in.

----

See the LICENSE file for licensing details.
