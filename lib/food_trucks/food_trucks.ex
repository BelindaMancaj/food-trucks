defmodule FoodTrucks.FoodTrucks do
  def get_trucks() do
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

        {:ok, Enum.map(results, fn %{applicant: applicant} -> applicant end)}

      {:ok, %{status_code: code, body: body}} ->
        {:error, "Failed with status code #{code} #{inspect(body)}"}

      {:error, reason} ->
        {:error, "Failed: #{inspect(reason)}"}
    end
  end
end
