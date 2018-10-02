require "rack/rewrite"

Rails.configuration.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
  r307 "/presentations", "/"
  r307 "/project_night", "/"
end
