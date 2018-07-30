Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get "welcome/say_hello" => "welcome#say_hello"
    get "welcome" => "welcome#index"

    root :to => "welcome#index" #将网站首页变成welcome#index
end

