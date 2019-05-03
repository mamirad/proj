json.extract! course_question, :id, :question, :answer, :option1, :option2, :option3, :option4, :option5, :questiontype, :teachercourse_id, :created_at, :updated_at
json.url course_question_url(course_question, format: :json)
