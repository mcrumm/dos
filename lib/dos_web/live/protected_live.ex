defmodule DosWeb.ProtectedLive do
  use DosWeb, :live_view

  on_mount {DosWeb.LiveAuth, :ensure_mounted_current_user}

  @impl true
  def render(assigns) do
    ~L"""
    Welcome to the Internet, <%= @current_user.email %>!
    """
  end
end
