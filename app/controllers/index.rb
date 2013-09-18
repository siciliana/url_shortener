get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index 
end

post '/urls' do
  puts params
  # initiate counter at 0
  # take input and create new item in links table 
  # generate shortlink
  erb :urls
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end
