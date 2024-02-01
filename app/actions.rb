
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do 
  erb(:signup)
end

post '/signup' do
  # Checks if username and avatar are on the page in the forms, if one or both are missing it will fail
  if params[:username].present? && params[:avatar].present?
    new_user = User.new({username: params[:username], avatar_url: params[:avatar]})
    new_user.save
    "Validation SUCCESSFUL!"
  else
    "Validation FAILED!"
  end
end