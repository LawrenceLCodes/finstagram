
# --- Helper methods --- 
# used for accessing @current_user on every .erb file or any page of this web application
helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

# --- Index ---
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

# --- Signup ---
get '/signup' do # if a user navigates to the path "/signup" page,
  @new_user = User.new # setup empty @user object
  erb(:signup) # render "app/views/signup.erb"
end

post '/signup' do
  # grab user input values from params
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]
  
  # instantiates a User and stores it in new_user variable
  @new_user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  # if user validations pass and user is saved into new_user variable
  if @new_user.save
    # If new user record has been successfully created, redirect them to login
    redirect to('/login')
  else
    # returns signup page to allow user to correct errors
    erb(:signup)
  end
end

# --- Login ---
get '/login' do # when a GET request comes into /login
  erb(:login) #render app/views/login.erb
end

post '/login' do # when we submit a form with an action for /login
  username = params[:username]
  password = params[:password]

  # 1. find the user by username
  user = User.find_by(username: username)

  # 2. If that user exists & the user's password matches the password input
  if user && user.password == password
    # Set the session hash to the user.id within their user record & redirect to index or homepage
    session[:user_id] = user.id
    redirect to('/')
  else
    # Display login has failed error message and return to login page
    @error_message = "Login has failed."
    erb(:login)
  end
end

# --- Logout ---
get '/logout' do
  # modifies session hash to remove :user_id data and sets it to nil or nothing
  # redirects user to index or homepage
  session[:user_id] = nil
  redirect to('/')
end

# --- Users ---
get '/users' do
  @users = User.all
  erb(:users)
end

get '/users/:id' do
  id = params[:id]
  @user = User.find(id)
  erb(:user)
end

# --- New Posts ---
get '/finstagram_posts/new' do
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end

post '/finstagram_posts' do
  photo_url = params[:photo_url]

  # instantiate new Finstagram Post
  # Using the current session hash, tie this new post to the currently logged in user's id
  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  # if post validates, save it to records
  if @finstagram_post.save
    redirect to('/')
  else
    # if post does NOT validate, print error messages to user
    erb(:"finstagram_posts/new")
  end
end

# --- Individual Posts ---
# :id used for individual posts and will be used to look up the post within the database
get '/finstagram_posts/:id' do
  @finstagram_post = FinstagramPost.find(params[:id])   # finds the finstagram post with the ID from the URL 
  erb(:"finstagram_posts/show")   # renders the app/views/finstagram_posts/show.erb page
end

get '/test/:name/:lastname/:age' do
  "Hello" + params[:name] + params[:lastname] + params[:age]
end

# before '/users' do # before we visit the users page, we want to do something
#   # We want to check if the user is logged in based on the session
#   # who is the user
#   name=session[:name]

#   if name != 'Larry'
#     redirect to('/')
#     halt(403, "You should be an admin!")
#   end
# end
