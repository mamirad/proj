Rails.application.routes.draw do

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


  # get 'punjab/home'
  # get 'teacher_auth/home'
  # get 'federal/home'
  #    #get 'admin/home'


  #      get '/admin', to: 'admin#home', as: 'admin_auth'
  #      get '/federal', to: 'federal#home', as: 'federal_auth'
  #       get '/punjab', to: 'punjab#home', as: 'punjab_auth'
  #       get '/teacher_auth', to: 'teacher_auth#home', as: 'teacher_auth'
  #        get '/teacher_cources', to: 'teacher_auth#view_teacher_cources', as: 'teacher_cources'

  #        get '/new_question/:role/:cource', to: 'teacher_auth#new_question', as: 'new_question'
  #       post '/create_question/:role/:cource', to: 'teacher_auth#create_question', as: 'create_question'

  #         get '/show_new_question', to: 'teacher_auth#show_new_question', as: 'show_new_question'
  #         get '/view_mcqs', to: 'teacher_auth#view_mcqs', as: 'view_mcqs'


  #           get '/view_federal_teachers/:cource_id', to: 'federal_cources#view_federal_teachers', as: 'view_federal_teachers'

  #   get '/federal_teacher_mcqs/:teacher_email', to: 'federal_cources#federal_teacher_mcqs', as: 'federal_teacher_mcqs'


  # get '/view_punjab_teachers/:cource_id', to: 'punjab_cources#view_punjab_teachers', as: 'view_punjab_teachers'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
