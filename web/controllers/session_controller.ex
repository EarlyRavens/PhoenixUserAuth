defmodule UserAuth.SessionController do
  use UserAuth.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
