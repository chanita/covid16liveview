defmodule Covid66liveWeb.NewLive do
  use Phoenix.LiveView
  alias Covid66live.Wiki
  require Logger

    def mount(_params, _session, socket) do
      Logger.debug "Mount"
      if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
      viruses = Wiki.get_all_viruses
      {:ok, assign(socket, viruses: viruses, date: NaiveDateTime.local_now())}
    end

    def handle_info(:tick, socket) do
      {:noreply, put_date(socket)}
    end
    defp put_date(socket) do
        assign(socket, date: NaiveDateTime.local_now())
    end


    @spec render(any) :: Phoenix.LiveView.Rendered.t()
    def render(assigns) do
      Logger.debug "Render"
      ~L"""
      <div>
        <h1>This is my Live View</h1>
        <h2>It's <%= @date %></h2>
        <%= for virus <- @viruses do %>
          <div>
          <h2><%= virus.code %></h2>
          <p><%= virus.name %> : <%= virus.description %></p>
          </div>
        <% end %>
      </div>
      """
    end
end
