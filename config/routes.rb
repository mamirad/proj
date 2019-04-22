Rails.application.routes.draw do

  get '/multipul_questions/new/:teachercourse', to: 'multipul_questions#new', as: 'new_multipul_question'
  resources :multipul_questions, :except=>[:new]
  root 'admin#home'
  get 'teacher_auth/home'
  resources :teachers
  resources :courses
  resources :groups
  resources :boards

  get '/admin', to: 'admin#home', as: 'admin'
  devise_for :users

  get '/view_teacher_cources', to: 'teacher_auth#view_teacher_cources', as: 'view_teacher_cources'
  get '/new_mcq/:teachercource', to: 'teacher_auth#new_mcq', as: 'new_mcq'
  post '/create_mcq/:teachercource', to: 'teacher_auth#create_mcq', as: 'create_mcq'

  get '/view_mcqs/:teachercource', to: 'teacher_auth#view_mcqs', as: 'view_mcqs'
  get '/edit_mcq/:mcq_id', to: 'teacher_auth#edit_mcq', as: 'edit_mcq'
  delete '/delete_mcq/:mcq_id', to: 'teacher_auth#delete_mcq', as: 'delete_mcq'

  patch 'update_mcq/:mcq_id', to: 'teacher_auth#update_mcq', as: 'update_mcq'

  get '/show_mcq/:mcq_id', to: 'teacher_auth#show_mcq', as: 'show_mcq'

  get '/teacher_mcqs/:teacher_id', to: 'teachers#teacher_mcqs', as: 'teacher_mcqs'






end
