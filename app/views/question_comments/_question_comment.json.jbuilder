json.extract! question_comment, :id, :comment, :status, :course_question_id, :user_id, :created_at, :updated_at
json.url question_comment_url(question_comment, format: :json)
