# get '/' do
#   # Reads the file that will be shown on the homepage - index.html
#   # Finds index.html inside app/views folder
#   File.read(File.join('app/views', 'index.html'))
# end

# # When a browser requests the root of the application
# get '/' do
#   # Send the string "Hello World!" to the browser  
#   "Hello World"
# # Stop 
# end

def humanized_time_elapsed(time_elapsed_in_minutes)
  if time_elapsed_in_minutes >= 60
    "#{time_elapsed_in_minutes / 60} hours ago"
  else 
    "#{time_elapsed_in_minutes} minutes ago"
  end
end

# Finstagram post data are stored into variables 
# comments are stored within an array
get '/' do
  @finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg",
    photo_url: "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg",
    humanized_time_elapsed: humanized_time_elapsed(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  @finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "https://live.staticflickr.com/65535/52358421348_f34c7996b1.jpg",
    photo_url: "https://live.staticflickr.com/65535/52357237337_1cc718f6a7_4k.jpg",
    humanized_time_elapsed: humanized_time_elapsed(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  @finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "https://live.staticflickr.com/65535/52358415933_0a0e6bc35f_3k.jpg",
    photo_url: "https://live.staticflickr.com/65535/52358494794_f88b160d15_4k.jpg",
    humanized_time_elapsed: humanized_time_elapsed(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]
  }

  # humanized_time_elapsed(finstagram_post[:time_elapsed_in_minutes])
  # finstagram_post.to_s
  # to_s is used to convert the array below into a string
  [@finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin].to_s

  @finstagram_posts = [@finstagram_post_shark, @finstagram_post_marlin, @finstagram_post_whale]
  
  erb(:index)
end

# For transition to dynamic erb pages
# get '/' do
#   @name = ["lawrence", "alice", "Liz", "Lydia"]
#   erb(:index)
# end

# get '/uers' do
#   erb(:users)
# end