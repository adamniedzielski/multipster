defmodule MultipsterWeb.Router do
  use MultipsterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MultipsterWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/initial_contacts", InitialContactsController, only: [:new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MultipsterWeb do
  #   pipe_through :api
  # end
end
