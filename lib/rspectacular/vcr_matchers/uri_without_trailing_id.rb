module  Rspectacular
module  VcrMatchers
class   UriWithoutTrailingId
  attr_accessor :trailing_id_matcher

  def initialize(trailing_id_matcher)
    self.trailing_id_matcher = trailing_id_matcher
  end

  def call(request, vcr_cassette_request)
    request_uri              = request.uri
    vcr_cassette_request_uri = vcr_cassette_request.uri

    if request_uri.match(trailing_id_matcher)
      request_uri_without_id              = request_uri.sub              trailing_id_matcher, ''
      vcr_cassette_request_uri_without_id = vcr_cassette_request_uri.sub trailing_id_matcher, ''

      request_uri.match(trailing_id_matcher) &&
      vcr_cassette_request_uri.match(trailing_id_matcher) &&
      request_uri_without_id == vcr_cassette_request_uri_without_id
    else
      request_uri == vcr_cassette_request_uri
    end
  end
end
end
end

VCR.configure do |config|
  config.register_request_matcher :uri_without_trailing_guid do |request, vcr_cassette_request|
    Rspectacular::VcrMatchers::UriWithoutTrailingId.new(%r(/[a-f0-9]{32}/?\z)).call(request, vcr_cassette_request)
  end

  config.register_request_matcher :uri_without_trailing_id do |request, vcr_cassette_request|
    Rspectacular::VcrMatchers::UriWithoutTrailingId.new(%r(/\d+/?\z)).call(request, vcr_cassette_request)
  end
end
