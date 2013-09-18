get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index 
end

def generate_shortlink(length=6)
  chars = 'abcdefghijklmnopqrstuvwxyzabABCDEFGHIJKLMNOPQRSTUVWXYZ123456789'
  shortlink = ''
  length.times { |char| shortlink << chars[rand(chars.length)] }
  p shortlink
end 

post '/urls' do
  puts params
  puts user_link = params[:link]
  puts @user_input = user_link[:original_link]

  @shortlink = generate_shortlink
  # create instance of a link record 
  link_record = Link.new
  
  erb :urls
end

# e.g., /q6bda
get '/:short_url' do
  # query the database to find original_link based on @shortlink
  # increment counter 
  # redirect to original_link
end



