Rails.application.routes.draw do

  get "/user", to: "user#index", as: "user"
  get "/user/index", to: "user#index"
  post "/user/formulary", to: "user#create", as:"form"
  get "/user/signing", to: "user#signing"
  get "/user/form", to: "user#form"
  get "/user/:usr", to: "user#delete"
  post "/user/signing", to: "user#signing_form", as:"sign"
  post "/user/logout", to: "user#logout", as:"log"

end
