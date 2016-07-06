defmodule Ex2 do
  def regurgitate do
    receive do
      {sender, msg} ->
        send sender, {:ok, msg}
        regurgitate
    end
  end

  def create_processes(token1, token2) do
    pid = spawn(Ex2, :regurgitate, [])

    send pid, {self, token1}
    send pid, {self, token2}

    receive do
      {:ok, ^token2} -> IO.puts "Received: '#{token2}'"
      after 500 ->
        IO.puts "Timed out..."
    end

    receive do
      {:ok, ^token1} -> IO.puts "Received: '#{token1}'"
      after 500 ->
        IO.puts "Timed out..."
    end
  end
end
