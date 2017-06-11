defmodule UserAuth.User do
  use UserAuth.Web, :model

  schema "users" do
    field :username, :string
    field :name, :string
    field :email, :string
    field :crypted_password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :name, :email, :crypted_password])
    |> validate_required([:username, :name, :email, :crypted_password])
    |> unique_constraint(:email)
  end
end
