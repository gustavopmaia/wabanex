defmodule Wabanex.Guardian do
  use Guardian, otp_app: :wabanex
  alias Wabanex.Users.Get

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    user = claims["sub"] |> Get.call
    {:ok, user}
  end
end
