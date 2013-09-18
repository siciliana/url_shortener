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
  p @link_record.save 
  erb :urls
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.id == User.authenticate(params[:email],params[:password])
    session[:user_id] = @user.id
    redirect '/secret_page'
  else 
    # @errors = "You aren't real."
    redirect "/"
  end 
end 







