module ViewHelpers
  def within_role(role, &block)
    within(%{[data-role="#{role}"]}, &block)
  end

  def have_role_text(role, text)
    have_css(%{[data-role*="#{role}"]}, text: text)
  end
end

RSpec.configure do |config|
  config.include ViewHelpers, type: :view
end
