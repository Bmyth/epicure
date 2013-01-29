Myapp::Application.routes.draw do
  match '/init' => 'main#init', :via => :get
  match '/pick' => 'main#pick', :via => :get
  match '/edit' => 'main#edit', :via => :get
  match '/rate' => 'main#rate', :via => :get
  match '/reset' => 'main#reset', :via => :post
  match '/rated' => 'main#rated', :via => :post
  root :to => 'main#index'
end
