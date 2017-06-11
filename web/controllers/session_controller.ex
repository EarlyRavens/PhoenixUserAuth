defmodule UserAuth.SessionController do
  use UserAuth.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case UserAuth.Session.login(session_params, UserAuth.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "You successfully Logged in")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Wrong login info, please try again.")
        |> render("new.html")
    end
  end

end
