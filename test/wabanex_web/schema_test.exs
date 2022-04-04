defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "user query" do
    test "when valid id is given, returns user", %{conn: conn} do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
      query{
        getUser(id: "#{user_id}"){
          id
          name
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{"data" => %{"getUser" => %{"email" => "gustavo@teste.com", "id" => _id, "name" => "Gustavo"}}} = response
    end

    test "when invalid id is given, returns error", %{conn: conn} do

      query = """
        {
          getUser(id: "9d1cbf33-68b2-47d0-ad1f-c970a12cfd8e"){
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{"data" => %{"getUser" => nil}, "errors" => [%{"locations" => [%{"column" => 5, "line" => 2}], "message" => "User not found", "path" => ["getUser"]}]}

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {name: "Clebao", email: "clebao@teste.com", password: "123456"}){
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"email" => "clebao@teste.com", "id" => _id, "name" => "Clebao"}}} = response
    end
  end
end
