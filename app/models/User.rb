class User < ActiveRecord::Base
    # One user can have many finstagram posts
    # one to many
    has_many :finstagram_posts
    # one user can have many comments
    has_many :comments
    # One user or post can have many likes
    has_many :likes

    # used for signup form validation purposes
    # email and username are checked for both uniqueness (each user must have a unique email and username, cannot be in user record for existing user) and presence (valid user records contain all four attributes)
    validates :email, :username, uniqueness: true
    validates :email, :avatar_url, :username, :password, presence: true
end