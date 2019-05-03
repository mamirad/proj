json.set! :data do
  json.array! @question_comments do |question_comment|
    json.partial! 'question_comments/question_comment', question_comment: question_comment
    json.url  "
              #{link_to 'Show', question_comment }
              #{link_to 'Edit', edit_question_comment_path(question_comment)}
              #{link_to 'Destroy', question_comment, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end