defmodule DosWeb.PickrLive do
  use DosWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~L"""
    <h2>flatpickr example</h2>

    <form id="pickr-form" action="#" phx-change="validate">
      <label for="starts-at">Starts at</label>
      <div id="starts-at-pickr" class="flatpickr" phx-update="ignore" phx-hook="Pickr" data-pickr-config="<%= @config %>">
        <input type="text" id="starts-at" name="pickr[starts_at]" placeholder="Select Start Date.." data-input />
      </div>

      <label for="ends-at">Ends at</label>
      <div id="ends-at-pickr" class="flatpickr" phx-update="ignore" phx-hook="Pickr" data-pickr-config="<%= @config %>">
        <input type="text" id="ends-at" name="pickr[ends_at]" placeholder="Select End Date.." data-input />
      </div>
    </form>

    <%= if @params do %>
    <p>Values: <code><%= @params %></code></p>
    <% end %>

    <form id="format" action="#" phx-change="format">
    <label>Alt Format</label>
    <input type="text" name="format" value="<%= @format %>"/>
    </form>
    """
  end

  @impl Phoenix.LiveView
  def handle_event("validate", %{"pickr" => _} = params, socket) do
    {:noreply, assign(socket, :params, inspect(params, pretty: true))}
  end

  def handle_event("format", %{"format" => ""}, socket) do
    socket =
      socket
      |> assign(:format, "")
      |> assign(:config, Jason.encode!(%{"altInput" => false}))

    {:noreply, socket}
  end

  def handle_event("format", %{"format" => format}, socket) do
    socket =
      socket
      |> assign(:format, format)
      |> assign(:config, Jason.encode!(%{"altInput" => true, "altFormat" => format}))

    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def mount(_, _, socket) do
    socket =
      socket
      |> assign(:params, nil)
      |> assign(:format, "")
      |> assign(:config, Jason.encode!(%{}))

    {:ok, socket}
  end
end
