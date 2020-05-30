require 'rails_helper'


def set_defautl_params
  before (:each) do
    @headers = {}
    @body_param = {
      userId: 1,
      id: 1,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit"
    }
    @query_params = {
      userId: 1
    }
    @base_url = "https://jsonplaceholder.typicode.com"
  end
end

RSpec.describe "RestClient" do
  describe "Test rest client calls" do
    set_defautl_params

    it "should make a get request" do
      result =
        RestClient::Get.new(
          "#{@base_url}/posts",
          @headers,
          @body_params,
          @query_params
        ).call
    
      expect(result.code).not_to eq(nil)
      expect(result.body).not_to eq(nil)
      expect(result.headers).not_to eq(nil)
    end

    it "should make a post request" do
      result =
        RestClient::Post.new(
          "#{@base_url}/posts",
          @headers,
          @body_params,
          @query_params
        ).call

      expect(result.code).not_to eq(nil)
      expect(result.body).not_to eq(nil)
      expect(result.headers).not_to eq(nil)
    end

    it "should make a patch request" do
      result =
        RestClient::Patch.new(
          "#{@base_url}/posts/1",
          @headers,
          @body_params,
          @query_params
        ).call

      expect(result.code).not_to eq(nil)
      expect(result.body).not_to eq(nil)
      expect(result.headers).not_to eq(nil)
    end

    it "should make a delete request" do
     result =
        RestClient::Delete.new(
          "#{@base_url}/posts/1",
          @headers,
          @body_params,
          @query_params
        ).call
        
      expect(result.code).not_to eq(nil)
      expect(result.body).not_to eq(nil)
      expect(result.headers).not_to eq(nil)
    end
  end
end
