json.users @users do |c|
  json.id c.id
  json.first_name c.first_name
  json.last_name c.last_name
  json.email c.email
  json.phone c.phone
  json.aptnum c.aptnum
end
