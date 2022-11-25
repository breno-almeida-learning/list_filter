defmodule ListFilter do
  require Integer

  def call(list), do: filterList(list)

  defp filterList(list) do
    Enum.flat_map(list, fn string ->
      case Integer.parse(string) do
        {number, ""} ->
          [number]

        :error ->
          []
      end
    end)
    |> Enum.filter(fn item -> Integer.is_odd(item) end)
    |> length()
  end
end
