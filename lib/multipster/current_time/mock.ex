defmodule Multipster.CurrentTime.Mock do
  @moduledoc """
  Mock implementation of Multipster.CurrentTime that allows to freeze and
  unfreeze time from tests
  """
  use Agent

  def start_link do
    Agent.start_link(
      fn ->
        %{is_frozen: false, frozen_value: nil}
      end,
      name: __MODULE__
    )
  end

  def get_timestamp do
    state = Agent.get(__MODULE__, fn state -> state end)

    if state[:is_frozen] do
      state[:frozen_value]
    else
      :os.system_time(:second)
    end
  end

  def freeze do
    freeze(:os.system_time(:second))
  end

  def freeze(timestamp) do
    Agent.update(__MODULE__, fn _state ->
      %{is_frozen: true, frozen_value: timestamp}
    end)
  end

  def unfreeze do
    Agent.update(__MODULE__, fn _state ->
      %{is_frozen: false, frozen_value: nil}
    end)
  end
end
