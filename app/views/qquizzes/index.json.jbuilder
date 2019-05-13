json.set! :data do
  json.array! @qquizzes do |qquiz|
    json.partial! 'qquizzes/qquiz', qquiz: qquiz
    json.url  "
              #{link_to 'Show', qquiz }
              #{link_to 'Edit', edit_qquiz_path(qquiz)}
              #{link_to 'Destroy', qquiz, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end