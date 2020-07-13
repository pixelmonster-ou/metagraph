defmodule Api.Schema.Film do
  use Absinthe.Schema.Notation

  alias Api.Resolvers.Film, as: FilmResolver

  object :film do
    field :uid, :string
    field :label, list_of(:language)
    field :description, list_of(:language)
    field :website, :string
    field :budget, :integer
    field :revenue, :integer
    field :wikidata_id, :string
    field :imdb_id, :string
    field :freebase_id, :string
    field :themoviedb_id, :integer
    field :genre, list_of(:genre)
  end

  object :film_queries do
    field :films, list_of(:film) do
      resolve &FilmResolver.list/3
    end

    field :film, :film do
      arg :uid, non_null(:string)
      resolve &FilmResolver.find/3
    end
  end
end
