class RestClient::Patch < RestClient::Requester

  def set_requester
    self.request = 
      Net::HTTP::Patch.new(
        self.uri,
        initheader = {
          'Content-Type' => 'application/json'
        }
      )
      self.request.body = self.body_params
  end
end