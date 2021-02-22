defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    # {:ok, file} = File.read("#{filename}.csv")

    # file = File.read("#{filename}.csv")
    # handle_file(file)

    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result_file}) do
    # result = String.split(result_file, ",")
    # result = Enum.map(result, fn number -> String.to_integer(number) end)
    # result = Enum.sum(result)

    result =
      result_file
      |> String.split(",")
      |> Enum.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    # result # sempre última linha retorno da função

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
