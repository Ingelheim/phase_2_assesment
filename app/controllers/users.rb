# LOGIN
get '/login' do
  erb :login
end

post '/login' do
  if user = User.authenticate(params[:user])
    session[:user_id] = user.id
    redirect "/home/#{user.id}"
  else
    redirect '/login'
  end
end


# SIGNUP
get '/signup' do
  erb :signup
end

post '/validate/email' do
  return "invalid" if User.find_by_email(params[:user][:email].downcase)
  "valid"
end

post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  
  redirect "/home/#{user.id}"
end


# HOME
get '/home/:user_id' do
  if params[:user_id] = current_user.id
    erb :user
  else
   redirect '/'
  end   
end 


# LOGOUT
get '/logout' do
  session.clear
  redirect '/'
end




