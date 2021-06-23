defmodule Dos.Repo do
  use Ecto.Repo,
    otp_app: :dos,
    adapter: Ecto.Adapters.Postgres
end
