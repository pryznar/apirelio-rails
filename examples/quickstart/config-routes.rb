Rails.application.routes.draw do
  get "/api/invoices/:id", to: proc { |env|
    id = env.fetch("action_dispatch.request.path_parameters").fetch(:id)
    [200, { "content-type" => "application/json" }, [{ id: id, status: "paid" }.to_json]]
  }
end
