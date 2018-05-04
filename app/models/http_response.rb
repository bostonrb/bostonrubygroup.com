class HttpResponse
  def initialize(body:, success:)
    @body = body
    @success = success
  end

  def parsed_body
    JSON.parse(body)
  end

  def success?
    success
  end

  private
  attr_reader :body, :success
end
