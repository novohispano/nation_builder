NationBuilder::Application.routes.draw do
  root 'events#index'

  get 'by_hour', to: 'events#index_by_hour'
end