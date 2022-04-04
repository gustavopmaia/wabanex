defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a user valid struct" do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{
          email: "gustavo@teste.com",
          name: "Gustavo"
        },
        errors: []
      } = response
    end

    test "when the password is missing, returns a changeset error" do
      params = %{name: "Gustavo", email: "gustavo@teste.com"}

      response = User.changeset(params)

      expected_response = %{password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end

    test "when the password doesnt have the enought lenght, returns a changeset error" do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "12345"}

      response = User.changeset(params)

      expected_response = %{password: ["should be at least 6 character(s)"]}

      assert errors_on(response) == expected_response
    end

    test "when the email is missing, returns a changeset error" do
      params = %{name: "Gustavo", password: "123456"}

      response = User.changeset(params)

      expected_response = %{email: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end

    test "when the email is invalid, returns a changeset error" do
      params = %{name: "Gustavo", email: "gustavoteste",  password: "123456"}

      response = User.changeset(params)

      expected_response = %{email: ["has invalid format"]}

      assert errors_on(response) == expected_response
    end

    test "when the name is missing, returns a changeset error" do
      params = %{email: "gustavo@teste.com", password: "123456"}

      response = User.changeset(params)

      expected_response = %{name: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end

    test "when the name doesnt have the enought lenght, returns a changeset error" do
      params = %{name: "G", email: "gustavo@teste.com", password: "123456"}

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"]}

      assert errors_on(response) == expected_response
    end
  end
end
