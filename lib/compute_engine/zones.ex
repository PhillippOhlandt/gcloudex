defmodule GCloudex.ComputeEngine.Zones do
  use GCloudex.ComputeEngine, :client

  @moduledoc """
  Wrapper for the Compute Engine's Zones endpoint.
  """

  @doc """
  Retrieves the list of Zone resources available according to the given
  'query_params'.
  """
  @spec list_zones(map) :: HTTPResponse.t
  def list_zones(query_params \\ %{}) do 
    query = query_params |> URI.encode_query

    HTTP.request :get, @no_zone_ep <> "/zones", [], "", query
  end  

  @doc """
  Returns the specified 'zone' resource. 
  """
  @spec get_zone(binary, binary) :: HTTPResponse.t
  def get_zone(zone, fields \\ "") do 
    query = %{"fields" => fields} |> URI.encode_query
    HTTP.request :get, @no_zone_ep <> "/zones/#{zone}", [], "", query
  end
end