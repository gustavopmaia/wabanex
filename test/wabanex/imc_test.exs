defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true
  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Dani" => 23.593749999999996,
           "Diego" => 23.13470521398813,
           "Gabul" => 23.020408163265305,
           "Gustavo" => 17.371428571428574,
           "Rafael" => 25.120495387659993,
           "Rodrigo" => 26.41975308641975
         }}

      assert response == expected_response
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "not_file.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
