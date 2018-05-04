class HttpClient
  def self.get(uri, options = {})
    new.get(uri, options)
  end

  def get(uri, options)
    response = HTTParty.get(uri, options)
    build_response(response)
  end

  private

  def build_response(response)
    HttpResponse.new(success: response.success?, body: response.body)
  end
end
