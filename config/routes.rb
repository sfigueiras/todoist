Rails.application.routes.draw do
  root to: "lists#index"

  get 'last_lists', to: 'lists#last', as: 'last_lists'

  resources 'lists' do
  	resources 'tasks' do
  		put 'reschedule'
  	end
  end
end
