defmodule ToDoAPI.Guardian do
  use Guardian, otp_app: :ToDoAPI
  require Logger

  def subject_for_token(user, _claims) do
    Logger.info("guardian1")
    Logger.info(inspect(user))
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    Logger.info("guardian2")
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    Logger.info("guardian3")
    id = claims["sub"]
    resource = ToDoAPI.Res.get_user!(id)
    {:ok,  resource}
  end

  def resource_from_claims(_claims) do
    Logger.info("guardian4")
    {:error, :reason_for_error}
  end
end
