defmodule ToDoAPI.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :MyApi,
  module: ToDoAPI.Guardian,
  error_handler: ToDoAPI.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
