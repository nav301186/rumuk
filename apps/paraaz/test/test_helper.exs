ExUnit.start

defmodule Ghuguti.Case do
  use ExUnit.CaseTemplate

  setup_all do
    on_exit fn ->
      # Riak.Helper.clean! pid
      {:ok, users} = Riak.Bucket.keys("maps", "users") 
       Enum.each(users, fn key -> Riak.delete("maps", "users", key) end)
       Enum.each(users, fn key -> Riak.find("maps", "users", key) end)
       {:ok, notifications} = Riak.Bucket.keys("maps", "notifications") 
     Enum.each(notifications, fn key -> Riak.delete("maps", "notifications", key) end)
     Enum.each(notifications, fn key -> Riak.find("maps", "notifications", key) end)
    end
    end
end

defmodule Ghuguti.Helper do
  def random_key do
    {me, se, mi} = :erlang.timestamp
    "#{me}#{se}#{mi}"
  end
end
