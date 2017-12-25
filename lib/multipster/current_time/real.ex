defmodule Multipster.CurrentTime.Real do
  @moduledoc """
  Standard implemtation for Multipster.CurrentTime that is meant to be used in
  development and production
  """
  def get_timestamp do
    :os.system_time(:second)
  end
end
