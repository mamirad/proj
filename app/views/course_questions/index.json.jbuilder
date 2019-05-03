json.set! :data do
  json.array! @course_questions do |course_question|
    json.partial! 'course_questions/course_question', course_question: course_question
    json.url  "
              #{link_to 'Show', course_question }
              #{link_to 'Edit', edit_course_question_path(course_question)}
              #{link_to 'Destroy', course_question, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end