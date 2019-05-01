json.set! :data do
  json.array! @question_papers do |question_paper|
    json.partial! 'question_papers/question_paper', question_paper: question_paper
    json.url  "
              #{link_to 'Show', question_paper }
              #{link_to 'Edit', edit_question_paper_path(question_paper)}
              #{link_to 'Destroy', question_paper, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end