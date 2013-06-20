get '/' do
  if user = current_user
    redirect "/home/#{user.id}"
  else
  erb :index
end
end
