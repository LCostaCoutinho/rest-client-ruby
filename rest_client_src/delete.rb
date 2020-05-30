class RestClient::Delete < RestClient::Requester

  def set_requester
    self.request = 
      Net::HTTP::Delete.new(
        self.uri,
        initheader = {
          'Content-Type' => 'application/json'
        }
      )
  end
end