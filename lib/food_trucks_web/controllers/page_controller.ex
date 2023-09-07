defmodule FoodTrucksWeb.PageController do
  use FoodTrucksWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    #   response = HTTPoison.get("https://data.sfgov.org/api/views/rqzj-sfat/rows.json")

    #   case response do
    #     {:ok, %{status_code: 200, body: body}} ->
    #       map = Poison.decode!(body)

    #       data = map["data"]

    #       results = Enum.map(data, fn row ->
    #         permit_number = Enum.at(row, 8)  # Access element by index
    #         applicant = Enum.at(row, 9)
    #         address = Enum.at(row, 12)
    #         %{permit_number: permit_number, applicant: applicant, location: address}
    #       end)
    #       applicants = Enum.map(results, fn %{applicant: applicant} -> applicant end)

    #       IO.inspect applicants
    #     {:ok, %{status_code: code, body: body}}  ->
    #       IO.puts "Failed with status code #{code} #{inspect body}"
    #     {:error, reason}  ->
    #       IO.puts "Failed: #{inspect reason}"
    #   end
    # end

    render(conn, :home, layout: false)
  end
end
