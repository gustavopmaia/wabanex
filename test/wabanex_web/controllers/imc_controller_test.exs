defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params is valid, returns imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Dani" => 23.593749999999996,
          "Diego" => 23.13470521398813,
          "Gabul" => 23.020408163265305,
          "Gustavo" => 17.371428571428574,
          "Rafael" => 25.120495387659993,
          "Rodrigo" => 26.41975308641975
        }
      }

      assert response == expected_response
    end

    test "when the params is invalid, returns error", %{conn: conn} do
      params = %{"filename" => "not_file.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
