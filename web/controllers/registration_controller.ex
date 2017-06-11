defmodule UserAuth.RegistrationController do
  use UserAuth.Web, :controller
  alias UserAuth.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case UserAuth.Registration.create(changeset, UserAuth.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "We were unable to create your account")
        |> render("new.html", changeset: changeset)
    end
  end

end
