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

  pipeline :require_authentication do
    plug MultipsterWeb.SignIn.Plug
  end

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.EmailPreviewPlug
  end

  scope "/", MultipsterWeb do
    pipe_through [:browser, :require_authentication]

    get "/", PageController, :index
    resources "/initial_contacts", InitialContactController, only: [:new, :create]
    resources "/comrades", ComradeController, only: [:index]
  end

  scope "/", MultipsterWeb do
    pipe_through :browser

    resources "/accounts", AccountController, only: [:new, :create]
    resources "/sign_in_links", SignInLinkController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MultipsterWeb do
  #   pipe_through :api
  # end
end
