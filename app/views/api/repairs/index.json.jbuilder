json.repairs @repairs do |c|
  json.name c.name
  json.created_at c.created_at
  json.completed c.completed
end
