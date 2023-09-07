defmodule FoodTrucksWeb.FoodTrucksController do
  use FoodTrucksWeb, :controller

  def index(conn, _params) do
    # cart_items = CartItems.list_cart_items()
    response = HTTPoison.get("https://data.sfgov.org/api/views/rqzj-sfat/rows.json")

    case response do
      {:ok, %{status_code: 200, body: body}} ->
        map = Jason.decode!(body)

        data = map["data"]

        results =
          Enum.map(data, fn row ->
            # Access element by index
            permit_number = Enum.at(row, 8)
            applicant = Enum.at(row, 9)
            address = Enum.at(row, 12)
            %{permit_number: permit_number, applicant: applicant, location: address}
          end)

        applicants = Enum.map(results, fn %{applicant: applicant} -> applicant end)
        render(conn, :index, data: applicants)

      {:ok, %{status_code: code, body: body}} ->
        IO.puts("Failed with status code #{code} #{inspect(body)}")
        render(conn, :error)

      {:error, reason} ->
        IO.puts("Failed: #{inspect(reason)}")
        render(conn, :error)

    end

  end
end
