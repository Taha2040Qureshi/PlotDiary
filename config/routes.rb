Rails.application.routes.draw do

  resources :maps
  resources :maps
  resources :maps
  get 'plots/map'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :skip => [:sessions]
  as :user do
    get 'town/signin' => 'town/sessions#new', :as => :new_user_session
    post 'town/signin' => 'town/sessions#create', :as => :user_session
    delete 'town/signout' => 'town/sessions#destroy', :as => :destroy_user_session
  end


  namespace :town do
    resources :towns
    resources :home
    resources :customers
    resources :employees
    resources :expense_types
    resources :expenses
    resources :investments
    resources :land_masters
    resources :plots
    get 'plots/map'
    resources :stake_holders
    resources :submit_installments do
      collection do
        get 'get_installment_details' => "submit_installments#get_installment_details"
      end
    end
    resources :given_installments do
      collection do
        get 'get_installment_details_land_master' => "given_installments#get_installment_details"
      end
    end
    resources :stocks
  end
end
