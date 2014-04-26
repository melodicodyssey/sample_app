SampleApp::Application.routes.draw do
  
  # RESTful routes:
  root "widgets#index"
  resources :widgets

  # Custom route:
  get "/foo", to: "widgets#bar", as: :foobar
    # Note the "Prefix" for this route below matches "as: :foobar" above.
    # This is a custom name for the path that I can use in the Views and Controllers.
    # For example: I can now write "redirect_to foobar_path" instead of "render '/foobar'"
    # You'll notice that Rails sometimes creates prefixes for you when using 'resources'


  # Routes:
  #
  #        Prefix Verb   URI Pattern                 Controller#Action
  #   ----------- -----  --------------------------  -----------------
  #        root   GET    /                           widgets#index
  #     widgets   GET    /widgets(.:format)          widgets#index
  #               POST   /widgets(.:format)          widgets#create
  #  new_widget   GET    /widgets/new(.:format)      widgets#new
  # edit_widget   GET    /widgets/:id/edit(.:format) widgets#edit
  #      widget   GET    /widgets/:id(.:format)      widgets#show
  #               PATCH  /widgets/:id(.:format)      widgets#update
  #               PUT    /widgets/:id(.:format)      widgets#update
  #               DELETE /widgets/:id(.:format)      widgets#destroy
  #      foobar   GET    /foo(.:format)              widgets#bar

end