defmodule FoodTrucksWeb.FoodTrucksController do
  use FoodTrucksWeb, :controller

  alias FoodTrucks.FoodTrucks

  def index(conn, _params) do
    case FoodTrucks.get_trucks() do
      {:ok, applicant} ->
        render(conn, :index, data: applicant)

      {:error, error} ->
        render(conn, error)
    end
  end
end
