require 'uri'
require 'torckapi/version'
require 'torckapi/errors'
require 'torckapi/tracker/http'
require 'torckapi/tracker/udp'
require 'torckapi/response/announce'
require 'torckapi/response/scrape'

module Torckapi
  @@debug = false
  
  def self.debug
    @@debug
  end
  
  def self.debug= debug
    @@debug = !!debug
  end
  
  # Creates a tracker interface instance
  # @param tracker_url [String] tracker announce url
  # @param options [Hash] defaults to \\{timeout: 15, tries: 3}
  # @return [Torckapi::Tracker::Base] tracker interface instance
  def self.tracker tracker_url, options={}
    url = URI.parse tracker_url

    case url.scheme
    when "http"
      Torckapi::Tracker::HTTP.new url, options
    when "udp"
      Torckapi::Tracker::UDP.new url, options
    else
      raise InvalidSchemeError, "'#{tracker_url}' cannot be recognized as valid tracker url"
    end
  end
end
