defmodule UserAuth.RegistrationController do
  use UserAuth.Web, :controller
  alias UserAuth.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
end
