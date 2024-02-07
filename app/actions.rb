
# --- Helper methods --- 
# used for accessing @current_user on every .erb file or any page of this web application
helpers do
  def current_user
    User.find_by(session[:user_id])
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