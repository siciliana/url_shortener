#contains the routes related to creating, displaying, and editing users

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/secret_page' do                   # change 
  if session[:user_id]
    erb :secret_page  
  else 
    redirect '/'
  end 
end 

get '/logout' do                       # add
  session.clear
  redirect '/'
end 

get '/login' do
  erb :login
end 

get '/create_user' do
  erb :create_user
end 

def generate_shortlink(length=6)
  chars = 'abcdefghijklmnopqrstuvwxyzabABCDEFGHIJKLMNOPQRSTUVWXYZ123456789'
  shortlink = ''
  length.times { |char| shortlink << chars[rand(chars.length)] }
  p shortlink
end 

get '/:shortened_link' do
  find_link = Link.find_by_shortened_link(params[:shortened_link]) 
  find_link.counter += 1
  find_link.save
  redirect find_link.original_link
end


#### URLS.RB ====================================================


#contains the routes related to listing, creating, and redirecting Url objects




post '/urls' do
  puts params
  puts user_link = params[:link]
  puts @user_input = user_link[:original_link]

  @shortlink = generate_shortlink
  # create instance of a link record 
  @link_record = Link.new
  @link_record.original_link = @user_input
  @link_record.shortened_link = @shortlink
  @link_record.counter = 0
  # if person logged in, save
    # if person logged in, don't save 
  if session[:user_id]
      u = User.find(session[:user_id])
      u.links << @link_record
  else 
      p @link_record.save 
  end
  erb :urls
end

post '/login' do
  user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  if user == false 
    erb :create_user
  else
    session[:user_id] = user.id
    redirect '/'
  end 
  #redirect # profile/:user_id


end 

post '/create_user' do
  u = User.new(params)
  u.save
  session[:user_id]=u.id
  redirect "/"
end 







