json.id @user.id
json.first_name @user.first_name
json.last_name @user.last_name

json.repairs @user.repairs do |p|
  json.(p, :id, :name, :repair_description, :created_at, :completed)
end
