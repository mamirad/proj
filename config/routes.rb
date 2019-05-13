Rails.application.routes.draw do




  get 'student_auth/home'
  get '/qquizzes/new/:teachercourse', to: 'qquizzes#new', as: 'new_qquizzes'
  resources :qquizzes, :except=>[:new]
  get '/view_quizs/:teachercource', to: 'teacher_auth#view_quizs', as: 'view_quizs'
  resources :question_comments
  get '/question_comments/new/:question_id', to: 'question_comments#new', as: 'new_question_comments'
  resources :question_comments, :except=>[:new]
  get '/course_questions/new/:teachercourse', to: 'course_questions#new', as: 'new_course_question'
  resources :course_questions, :except=>[:new]
  get 'proof_reader/home'






  
  # resources :qp_comments, :except=>[:new]
  # get '/qp_comment/new/:qp_id', to: 'qp_comments#new', as: 'new_qp_comment'
  # resources :question_papers, :except=>[:new]
  # get '/question_papers/new/:teachercourse', to: 'question_papers#new', as: 'new_question_paper'
  #
  # get '/multipul_questions/new/:teachercourse', to: 'multipul_questions#new', as: 'new_multipul_question'
  # resources :multipul_questions, :except=>[:new]







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
  get '/view_questions/:teachercource', to: 'teacher_auth#view_questions', as: 'view_questions'
  get '/edit_mcq/:mcq_id', to: 'teacher_auth#edit_mcq', as: 'edit_mcq'
  delete '/delete_mcq/:mcq_id', to: 'teacher_auth#delete_mcq', as: 'delete_mcq'
  patch 'update_mcq/:mcq_id', to: 'teacher_auth#update_mcq', as: 'update_mcq'
  get '/show_mcq/:mcq_id', to: 'teacher_auth#show_mcq', as: 'show_mcq'
  get '/teacher_questions/:teacher_id', to: 'teachers#teacher_questions', as: 'teacher_questions'



  get '/search_quiz', to: 'student_auth#search_quiz', as: 'search_quiz'
  get '/quiz_code', to: 'student_auth#quiz_code', as: 'quiz_code'
  get '/sol_quiz', to: 'student_auth#sol_quiz', as: 'sol_quiz'


  get '/mark_quiz/:quiz', to: 'teacher_auth#mark_quiz', as: 'mark_quiz'
  get '/update_quiz_marks/', to: 'teacher_auth#update_quiz_marks', as: 'update_quiz_marks'


end
