json.repairs @repairs do |c|
  json.name c.name
  json.id c.id
  json.repair_description c.repair_description
  json.created_at c.created_at
  json.completed c.completed
  json.date_completed c.date_completed
  json.first_name c.user.first_name
  json.last_name c.user.last_name
  json.aptnum c.user.aptnum
end
