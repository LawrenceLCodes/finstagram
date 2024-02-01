class User < ActiveRecord::Base
    # One user can have many finstagram posts
    # one to many
    has_many :finstagram_posts
    # one user can have many comments
    has_many :comments
    # One user or post can have many likes
    has_many :likes
end