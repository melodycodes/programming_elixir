defmodule Ex4 do
  import :timer, only: [sleep: 1]

  def stuff(sender) do
    send sender, "Message Uno"
    raise "Another message"
    exit("blah")
  end

  def check_messages do
    receive do
      msg -> IO.puts "Received Message: #{inspect msg}"
      check_messages
    after 1000 ->
      IO.puts "No more messages"
    end
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Ex4, :stuff, [self])
    sleep 500
    check_messages
  end
end

Ex4.run
