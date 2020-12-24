defmodule Editor do
  @moduledoc """
  Documentation for `Editor`.
  """

  alias Editor.Schema

  @doc """
  Create an item with the specific values
  """
  def create(%Ecto.Changeset{valid?: false} = changeset, _actor), do: {:error, changeset}

  def create(changeset, actor),
    do:
      changeset
      |> AuditorDlex.insert(actor)

  @doc """
  Update an item with values
  """
  def update(_, %Ecto.Changeset{valid?: false} = changeset, _actor), do: {:error, changeset}

  def update(actual_item, changeset, actor),
    do:
      actual_item
      |> Schema.check(changeset, :update, actor)

  def delete(uid, actor) do
  end

  def lock(uid, "*", actor) do
  end

  def lock(uid, predicate, actor) do
  end
end
