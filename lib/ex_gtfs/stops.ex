defmodule ExGTFS.Stops do
  defstruct ~w(
    stop_id
    stop_name
    stop_lat
    stop_lon
    stop_code
  )a

  def parse(path) do
    path
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Stream.map(&new_from_csv/1)
    |> Enum.to_list()
    |> then(& {:ok, &1})
  end

  defp new_from_csv(%{
    "stop_id" => stop_id,
    "stop_name" => stop_name,
    "stop_lat" => stop_lat,
    "stop_lon" => stop_lon,
    "stop_code" => stop_code
  }) do
    %__MODULE__{
      stop_id: stop_id,
      stop_name: stop_name,
      stop_lat: stop_lat |> String.to_float(),
      stop_lon: stop_lon |> String.to_float(),
      stop_code: stop_code
    }
  end
end
