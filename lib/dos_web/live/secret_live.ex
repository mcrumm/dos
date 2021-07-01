defmodule DosWeb.SecretLive do
  use DosWeb, :live_view

  def render(assigns) do
    ~L"""
    <p>Welcome to the secret area.</p>
    <%= live_redirect("Protected", to: Routes.protected_path(@socket, :index)) %>
    | <%= live_redirect("Reload", to: Routes.secret_path(@socket, :index)) %>
    """
  end
end
