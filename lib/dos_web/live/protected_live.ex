defmodule DosWeb.ProtectedLive do
  use DosWeb, :live_view

  @impl true
  def render(assigns) do
    ~L"""
    <p>Welcome to the Internet, <%= @current_user.email %>!</p>

    <%= live_redirect("Secret", to: Routes.secret_path(@socket, :index)) %>
    """
  end
end
