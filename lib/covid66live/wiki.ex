defmodule Covid66live.Wiki do
  alias Covid66live.Repo
  alias Covid66live.Info.Virus

  def get_all_viruses do
    Repo.all(Virus)
  end
end
