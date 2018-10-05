module ViewHelpers
  def have_role_text(role, text)
    have_css(%{[data-role*="#{role}"]}, text: text)
  end
end

RSpec.configure do |config|
  config.include ViewHelpers, type: :view
end
