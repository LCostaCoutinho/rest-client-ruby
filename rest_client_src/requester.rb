require 'net/http'
require 'net/https'

class RestClient::Requester

  class_attribute :url, :body_params, :query_params, :response, :headers, :http, :uri, :request

  def initialize(url, headers = [], body_params = {}, query_params = {})
    self.url = url
    self.headers = headers
    self.body_params = body_params
    self.query_params = query_params
  end

  def call
    begin
      initialize_request
      set_requester
      set_headers
      make_request
    rescue => error
      self.response = 
      OpenStruct.new({
        body: {
          error: error.message,
          location: :internal,
          backtrace: error.backtrace.join("\n")
        },
        headers: nil,
        code: nil
      })
    ensure
      return self.response
    end
    
  end

  def make_request
    self.response = 
    RestClient::ResponseHandler.new(
      self.http.request(self.request)
    ).call
  end

  def initialize_request
    self.uri = URI(self.url)
    self.http = Net::HTTP.new(self.uri.host, self.uri.port)
    self.http.use_ssl = true
    self.http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  end

  def set_headers
    self.headers.each do |header|
      self.request.add_field(header[:key], header[:value])
    end
  end

  def set_requester
    raise 'must implement'
  end

end
