json.repairs @repairs do |c|
  json.name c.name
  json.created_at c.created_at
  json.completed c.completed
  json.completed_at c.completed_at
  json.first_name c.user.first_name
  json.last_name c.user.last_name
  json.aptnum c.user.aptnum
end
