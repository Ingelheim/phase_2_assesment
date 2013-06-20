
# CREATE
get '/create' do
  if request.xhr?
    erb :_create, :layout => false, locals: {:xhr => true}
  else
    erb :_create
  end  
end

post '/create' do
  event = Event.create(params[:event])
  if request.xhr?
    erb :_event_table, :layout => false, locals: {:current_user => current_user}
  else
    redirect "/home/#{current_user.id}"
  end
end


# EDIT
get '/edit/:id' do
  @event = Event.find(params[:id])
  erb :edit
end

post '/edit' do
  event = Event.find(params[:event_id])
  event.destroy
  Event.create(params[:event])

  redirect "/home/#{current_user.id}"
end


# DELETE
get '/delete/:id' do
  event = Event.find(params[:id])
  event.destroy
  redirect "/home/#{current_user.id}"
end  
