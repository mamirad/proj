json.set! :data do
  json.array! @qp_comments do |qp_comment|
    json.partial! 'qp_comments/qp_comment', qp_comment: qp_comment
    json.url  "
              #{link_to 'Show', qp_comment }
              #{link_to 'Edit', edit_qp_comment_path(qp_comment)}
              #{link_to 'Destroy', qp_comment, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end