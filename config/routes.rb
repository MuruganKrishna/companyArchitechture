Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/y', as: 'rails_admin'
  
  namespace :api do
    namespace :v1 do
      post 'get_name',to: 'names#showname'
      get 'get_name',to: 'names#showname'
      resources :salaries
      post '/get_salarydata',to: 'salaries#get_salarydata'
      get '/get_salarydata',to: 'salaries#get_salarydata'
      get 'get_paidemployee', to:'salaries#get_paidemployee'
      post 'get_paidemployee', to:'salaries#get_paidemployee'
      get 'get_paidemployee1', to:'salaries#get_paidemployee1'
      post 'get_paidemployee1', to:'salaries#get_paidemployee1'
      get 'percost', to:'salaries#percost'
      post 'percost', to:'salaries#percost'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :reimbursements
    end
  end
  namespace :api do
    namespace :v1 do
      resources :attendances
    end
  end
  namespace :api do
    namespace :v1 do
      resources :payments
    end
  end
  namespace :api do
    namespace :v1 do
      resources :asserts
    end
  end
  namespace :api do
    namespace :v1 do
      resources :employees

    end
  end
  namespace :api do
    
    namespace :v1 do
      resources :companies
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
