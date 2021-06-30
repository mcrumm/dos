defmodule DosWeb.LiveAuth do
  alias Phoenix.LiveView
  alias DosWeb.Router.Helpers, as: Routes

  def ensure_mounted_current_user(_params, session, socket) do
    case session do
      %{"user_token" => token} ->
        {:cont,
         LiveView.assign_new(socket, :current_user, fn ->
           Dos.Accounts.get_user_by_session_token!(token)
         end)}

      _ ->
        {:halt,
         socket
         |> LiveView.put_flash(:error, "You must log in to access this page.")
         |> LiveView.redirect(to: Routes.user_session_path(socket, :new))}
    end
  end
end
