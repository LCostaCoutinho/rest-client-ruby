class RestClient::Get < RestClient::Requester

  def set_requester
    self.request = 
      Net::HTTP::Get.new(
        self.uri,
        initheader = {
          'Content-Type' => 'application/json'
        }
      )
  end
end