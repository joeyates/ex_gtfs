defmodule ExGTFS.StopsTest do
  use ExUnit.Case

  test "parse" do
    assert {:ok, stops} = ExGTFS.Stops.parse("test/support/fixtures/stops.txt")

    assert Enum.count(stops) == 25
    assert hd(stops) == %ExGTFS.Stops{
      stop_code: "ALB",
      stop_id: "ALB_22",
      stop_lat: 43.3861772649411,
      stop_lon: 11.7522045930205,
      stop_name: "Albergo (Xxx)"
    }
  end
end
