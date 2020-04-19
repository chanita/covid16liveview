defmodule Covid66liveWeb.VirusListLive do
  use Phoenix.LiveView
  require Logger

    @spec mount(any, any, any) :: {:ok, any}
  def mount(_params, _session, socket) do
    Logger.debug "Mount"
    {:ok, socket}
  end


  def render(assigns) do
    Logger.debug "Render"
    ~L"""
    <div>
      <h1>This is my Live View</h1>
    </div>
    """
  end
end
