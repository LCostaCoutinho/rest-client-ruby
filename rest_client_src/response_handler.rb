class RestClient::ResponseHandler

  class_attribute :body, :code, :headers

  def initialize(response)
    self.body = response.body
    self.code = response.code.to_i
    self.headers = response.header
  end

  def call
    hand_response
    return self
  end

  def hand_response
    if self.body.present?
      self.body = JSON.parse(self.body, symbolize_names: true, object_class: OpenStruct)
    end
  end
end