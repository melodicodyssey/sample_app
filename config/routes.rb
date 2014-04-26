SampleApp::Application.routes.draw do
  root "widgets#index"
  resources :widgets

# Routes:
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
end
