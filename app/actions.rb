get '/' do
  # Reads the file that will be shown on the homepage - index.html
  # Finds index.html inside app/views folder
  File.read(File.join('app/views', 'index.html'))
end